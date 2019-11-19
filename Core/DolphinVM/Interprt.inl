/******************************************************************************

	File: Interprt.Inl

	Description:

	Public inlines for the interpreter bodules

******************************************************************************/
#pragma once

#ifndef CHECKREFERENCES
	#error You'll need to include interprt.h
#endif

#include "STExternal.h"
#include "STFloat.h"
#include "STInteger.h"

#define primitiveSuccess(argCount) (Interpreter::m_registers.m_stackPointer - argCount)

inline void Interpreter::GrabAsyncProtect()
{
	::EnterCriticalSection(&m_csAsyncProtect);
}

inline void Interpreter::RelinquishAsyncProtect()
{
	::LeaveCriticalSection(&m_csAsyncProtect);
}

//=============
//Stack Inlines 
//=============

inline void Interpreter::push(LPCSTR pStr)
{
	if (pStr)
		pushNewObject((OTE*)AnsiString::New(pStr));
	else
		pushNil();
}

inline void Interpreter::pushHandle(HANDLE h)
{
	if (h)
		pushNewObject((OTE*)ExternalHandle::New(h));
	else
		pushNil();
}

inline void Interpreter::push(double d)
{
	pushNewObject((OTE*)Float::New(d));
}

inline void Interpreter::pushNil()
{
	push(Oop(Pointers.Nil));
}

inline void Interpreter::pushSmallInteger(SMALLINTEGER n)
{
	push(ObjectMemoryIntegerObjectOf(n));
}

inline void Interpreter::pushUnsigned(uint32_t value)
{
#ifdef _M_IX86
	pushNewObject(Integer::NewUnsigned(value));
#else
	pushSmallInteger(value);
#endif
}

inline void Interpreter::pushUIntPtr(UINT_PTR uptrValue)
{
	pushNewObject(Integer::NewUnsigned(uptrValue));
}

inline void Interpreter::pushSigned(int32_t lValue)
{
#ifdef _M_IX86
	pushNewObject(Integer::NewSigned(lValue));
#else
	pushSmallInteger(lValue);
#endif
}

inline void Interpreter::pushIntPtr(INT_PTR ptrValue)
{
	pushNewObject(Integer::NewSigned(ptrValue));
}

inline void Interpreter::pushBool(BOOL bValue)
{
	push(Oop(bValue == 0 ? Pointers.False : Pointers.True));
}

inline void Interpreter::pushNewObject(Oop oop)
{
	if (ObjectMemoryIsIntegerObject(oop))
		push(oop);
	else
		pushNewObject(reinterpret_cast<OTE*>(oop));
}

inline void Interpreter::push(Oop object)
{
	// Unfortunately the Compiler generate code with an AGI penalty for this by
	// performing the +1 before writing through the new SP, and I can't persuade
	// it to use an instruction with an offset
	Oop* const sp = m_registers.m_stackPointer;
	sp[1] = object;
	m_registers.m_stackPointer = sp+1;
}

inline Oop Interpreter::popAndCountUp()
{
	Oop top = *m_registers.m_stackPointer--;
	ObjectMemory::countUp(top);
	return top;
}

///////////////////////////////////////////////////////////////////////////////
// Functors for instantiating primitive templates

struct StoreSmallInteger
{
	__forceinline constexpr void operator()(Oop* const sp, SMALLINTEGER value)
	{
		*sp = ObjectMemoryIntegerObjectOf(value);
	}
};

struct StoreUIntPtr
{
	__forceinline void operator()(Oop* const sp, uintptr_t ptr)
	{
		if (ObjectMemoryIsPositiveIntegerValue(ptr))
		{
			*sp = ObjectMemoryIntegerObjectOf(ptr);
		}
		else
		{
			LargeIntegerOTE* oteLi = LargeInteger::liNewUnsigned(ptr);
			*sp = reinterpret_cast<Oop>(oteLi);
			ObjectMemory::AddToZct((OTE*)oteLi);
		}
	}
};

struct StoreIntPtr
{
	__forceinline void operator()(Oop* const sp, intptr_t ptr)
	{
		if (ObjectMemoryIsIntegerValue(ptr))
		{
			*sp = ObjectMemoryIntegerObjectOf(ptr);
		}
		else
		{
			LargeIntegerOTE* oteLi = LargeInteger::liNewSigned(ptr);
			*sp = reinterpret_cast<Oop>(oteLi);
			ObjectMemory::AddToZct((OTE*)oteLi);
		}
	}
};

struct StoreUnsigned64
{
	__forceinline void operator()(Oop* const sp, uint64_t value)
	{
		Oop result = LargeInteger::NewUnsigned(value);
		*sp = result;
		ObjectMemory::AddOopToZct(result);
	}
};

struct StoreSigned64
{
	__forceinline void operator()(Oop* const sp, int64_t value)
	{
		Oop result = LargeInteger::NewSigned(value);
		*sp = result;
		ObjectMemory::AddOopToZct(result);
	}
};

// Functor to write a 32-bit signed integer to a stack location - used in primitives
struct StoreSigned32
{
	__forceinline void operator()(Oop* const sp, int32_t value)
	{
#ifdef _M_X64
		*sp = ObjectMemoryIntegerObjectOf(value);
#else
		if (ObjectMemoryIsIntegerValue(value))
		{
			*sp = ObjectMemoryIntegerObjectOf(value);
		}
		else
		{
			LargeIntegerOTE* oteLi = LargeInteger::liNewSigned(value);
			*sp = reinterpret_cast<Oop>(oteLi);
			ObjectMemory::AddToZct((OTE*)oteLi);
		}
#endif
	}
};

// Functor to write a 32-bit positive integer to a stack location - used in primitives
struct StoreUnsigned32
{
	__forceinline void operator()(Oop* const sp, uint32_t value)
	{
#ifdef _M_X64
		* sp = ObjectMemoryIntegerObjectOf(value);
#else
		if (ObjectMemoryIsPositiveIntegerValue(value))
		{
			*sp = ObjectMemoryIntegerObjectOf(value);
		}
		else
		{
			LargeIntegerOTE* oteLi = LargeInteger::liNewUnsigned(value);
			*sp = reinterpret_cast<Oop>(oteLi);
			ObjectMemory::AddToZct((OTE*)oteLi);
		}
#endif
	}
};

///////////////////////////////////////////////////////////////////////////////
// Object field access

#ifndef _M_IX86
	// Intel version in assembler (see primitiv.cpp)
	inline SMALLINTEGER __fastcall smalltalkMod(SMALLINTEGER numerator, SMALLINTEGER denominator)
	{
		SMALLINTEGER quotient = numerator/denominator;
		quotient = quotient - (quotient < 0 && quotient*denominator!=numerator);
		return numerator - (quotient * denominator);
	}
#else
	// See primasm.asm
	extern int __fastcall smalltalkMod(int numerator, int denominator);
#endif

inline bool Interpreter::IsShuttingDown()
{
	return m_bShutDown;
}

inline DWORD Interpreter::MainThreadId()
{
	return m_dwThreadId;
}

inline HANDLE Interpreter::MainThreadHandle()
{
	return m_hThread;
}

inline InterpreterRegisters& Interpreter::GetRegisters() 
{
	return m_registers; 
}


inline BOOL Interpreter::isAFloat(Oop objectPointer)
{
	return ObjectMemory::fetchClassOf(objectPointer) == Pointers.ClassFloat;
}

#ifdef PROFILING
	#define STARTPROFILING() Interpreter::StartProfiling()
	#define STOPPROFILING()	 Interpreter::StopProfiling()
#else
	#define STARTPROFILING()
	#define STOPPROFILING()
#endif

inline void Interpreter::sendSelectorArgumentCount(SymbolOTE* selector, uintptr_t argCount)
{
	m_oopMessageSelector = selector;
	sendSelectorToClass(ObjectMemory::fetchClassOf(*(m_registers.m_stackPointer - argCount)), argCount);
}

inline void Interpreter::sendSelectorToClass(BehaviorOTE* classPointer, uintptr_t argCount)
{
	MethodCacheEntry* pEntry = findNewMethodInClass(classPointer, argCount);
	executeNewMethod(pEntry->method, argCount);
}

inline void	Interpreter::NotifyAsyncPending()
{
	InterlockedExchange(m_pbAsyncPending, TRUE);
}

///////////////////////////////////////////////////////////////////////////////
// Finalization/Bereavement 

// The argument has had a temporary reprieve; we place it on the finalization queue to permit it to
// fulfill its last requests. At the moment the queue is FILO.

inline void Interpreter::basicQueueForFinalization(OTE* ote)
{
	ASSERT(!isIntegerObject(ote));
	ASSERT(!ObjectMemory::isPermanent(ote));
	// Must keep the OopsPerEntry constant in sync. with num objects pushed here
	m_qForFinalize.Push(ote);
}

inline void Interpreter::queueForFinalization(OTE* ote, size_t highWater)
{
	basicQueueForFinalization(ote);
	asynchronousSignal(Pointers.FinalizeSemaphore);

	size_t count = m_qForFinalize.Count();
	// Only raise interrupt when high water mark is hit!
	if (count == highWater)
		queueInterrupt(VMI_HOSPICECRISIS, ObjectMemoryIntegerObjectOf(count));
}

inline void Interpreter::queueForBereavementOf(OTE* ote, Oop argPointer)
{
	ASSERT(ote->isWeak());
	ASSERT(ObjectMemoryIsIntegerObject(argPointer));

	// Must keep the OopsPerEntry constant in sync. with num objects pushed here
	m_qBereavements.Push(reinterpret_cast<Oop>(ote));
	m_qBereavements.Push(argPointer);
}

///////////////////////////////////////////////////////////////////////////////
// FFI support

inline AddressOTE* ST::ExternalAddress::New(void* ptr)
{
	return reinterpret_cast<AddressOTE*>(Interpreter::NewIntPtr(reinterpret_cast<uintptr_t>(ptr), Pointers.ClassExternalAddress));
}

inline HandleOTE* ST::ExternalHandle::New(HANDLE hValue)
{
	return reinterpret_cast<HandleOTE*>(Interpreter::NewIntPtr(reinterpret_cast<uintptr_t>(hValue), Pointers.ClassExternalHandle));
}

///////////////////////////////////////////////////////////////////////////////
// Primitive templates

template <int Index> Oop* __fastcall Interpreter::primitiveReturnConst(Oop* const sp, primargcount_t argCount)
{
	Oop* newSp = sp - argCount;
	if (!m_bStepping)
	{
		*newSp = Pointers.pointers[Index - 1];
		return newSp;
	}
	else
	{
		return primitiveFailure(_PrimitiveFailureCode::DebugStep);
	}
}
