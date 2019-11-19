/******************************************************************************

	File: OTE.h

	Description:

	Definition of object table entry (OTE).

	N.B. The classes here defined are well known to the VM, and must not
	be modified in the image. Note also that these classes may also have
	a representation in the assembler modules (so see istasm.inc)

******************************************************************************/
#pragma once

#define COUNTBITS	(sizeof(BYTE)*8)
#define SPACEBITS	3
#define NULLTERMTYPE WCHAR
//#define NULLTERMTYPE char
#define NULLTERMSIZE sizeof(NULLTERMTYPE)

template <class T> class TOTE;

// Declare forward references
namespace ST
{
	class Behavior;
}
typedef TOTE<ST::Behavior> BehaviorOTE;

typedef	uint8_t count_t;
typedef uint16_t hash_t;						// Identity hash value, assigned on object creation

union OTEFlags
{
	// Object Creation
	enum Spaces { NormalSpace, VirtualSpace, BlockSpace, ContextSpace, IntPtrSpace, HeapSpace, FloatSpace, PoolSpace, NumSpaces };

	struct
	{
		BYTE	m_free : 1;				// Is the object in use?
		BYTE	m_pointer : 1; 			// Pointer bit?
		BYTE	m_mark : 1;				// Garbage collector mark
		BYTE	m_finalize : 1;			// Should the object be finalized
		BYTE 	m_weakOrZ : 1;			// weak references if pointers, null term if bytes
		BYTE 	m_space : SPACEBITS;	// Memory space in which the object resides (used when deallocating)
	};
	BYTE m_value;

	// Often it is more efficient to use masking to avoid a 16-bit load operation
	enum
	{
		FreeMask = 1,
		PointerMask = 1 << 1,
		MarkMask = 1 << 2,
		FinalizeMask = 1 << 3,
		WeakOrZMask = 1 << 4,
		SpaceMask = 0x7 << 5,
	};
	enum { WeakMask = (PointerMask | WeakOrZMask) };
};


// Class of object table entries
// This is really opaque to everybody but the ObjectMemory (or should be)
template <class T> class TOTE
{
public:
	static constexpr count_t MAXCOUNT = ((2 << (COUNTBITS - 1)) - 1);
	static constexpr uintptr_t SizeMask = INTPTR_MAX;
	static constexpr uintptr_t ImmutabilityBit = static_cast<uintptr_t>(INTPTR_MAX) + 1;

	__forceinline size_t getSize() const						{ return m_size & SizeMask; }
	__forceinline void setSize(size_t size)						{ m_size = size; }

	__forceinline size_t getWordSize() const					{ return getSize()/sizeof(uintptr_t); }
	__forceinline size_t pointersSize() const					{ ASSERT(isPointers());	return getSize()/sizeof(uintptr_t); }
	__forceinline ptrdiff_t pointersSizeForUpdate() const		{ ASSERT(isPointers());	return static_cast<intptr_t>(m_size)/static_cast<intptr_t>(sizeof(uintptr_t)); }
	__forceinline size_t bytesSize()	const					{ ASSERT(isBytes()); return getSize(); }
	__forceinline ptrdiff_t bytesSizeForUpdate() const			{ ASSERT(isBytes()); return m_size; }

	// The size of a byte object can be one more than it pretends because of the hidden null terminator!
	// Answers actual byte (heap) size of the object pointed at by this OTE
	__forceinline size_t sizeOf() const
	{
		// If we use getSize() here, it does not get inlined
		return getSize() + (isNullTerminated() * NULLTERMSIZE);
	}

	// The required size for this variable pointer object to accommodate the specified number of indexable fields
	__forceinline uintptr_t pointerSizeFor(uintptr_t pointersRequested) { ASSERT(isPointers()); return pointersRequested + m_oteClass->m_location->fixedFields(); }

	__forceinline BOOL isSticky() const						{ return m_count == MAXCOUNT; }
	__forceinline void beSticky()							{ m_count = MAXCOUNT; }

	// Answer whether the receiver has the current mark
	__forceinline void setMark(BYTE mark)					{ m_flags.m_mark = mark; }

	__forceinline uintptr_t getIndex()	const					{ return this - reinterpret_cast<const TOTE<T>*>(ObjectMemory::m_pOT); }

	__forceinline void countUp() 
	{ 
#ifdef _DEBUG
		if (m_count < MAXCOUNT) m_count++;
#else
		// Deliberately truncate to zero to detect sticky
		count_t up = m_count + 1;
		if (up != 0) m_count = up; 
#endif
	}

	__forceinline void countDown()
	{
		HARDASSERT(m_count > 0);
		if (m_count != MAXCOUNT)
	 		if (--m_count == 0)
				ObjectMemory::AddToZct((OTE*)this);
	}

	void countDownStackRef()
	{
		HARDASSERT(m_count > 0);
		if (m_count != MAXCOUNT)
			if (--m_count == 0)
				ObjectMemory::AddStackRefToZct((OTE*)this);
	}

	__forceinline bool decRefs()							{ return (m_count != MAXCOUNT) && (--m_count == 0); }
	__forceinline bool isImmutable() const					{ return static_cast<intptr_t>(m_size) < 0; }
	__forceinline void beImmutable()						{ m_size |= ImmutabilityBit; }
	__forceinline void beMutable()							{ m_size &= SizeMask; }
	__forceinline BOOL isFree() const						{ return m_dwFlags & OTEFlags::FreeMask; /*m_flags.m_free;*/ }
	__forceinline void beFree()								{ m_dwFlags |= OTEFlags::FreeMask; }
	__forceinline void setFree(bool bFree)					{ m_flags.m_free = bFree; }
	__forceinline void beAllocated()						{ m_dwFlags &= ~OTEFlags::FreeMask; }
	__forceinline BOOL isPointers() const					{ return m_flags.m_pointer; }
	__forceinline void bePointers()							{ m_dwFlags |= OTEFlags::PointerMask; }
	__forceinline BOOL isBytes() const						{ return !m_flags.m_pointer; }
	__forceinline void beBytes()							{ m_dwFlags &= ~OTEFlags::PointerMask; }
	__forceinline BOOL isFinalizable()	const				{ return m_flags.m_finalize; }
	__forceinline void beFinalizable()						{ m_dwFlags |= OTEFlags::FinalizeMask; }
	__forceinline void beUnfinalizable()					{ m_dwFlags &= ~OTEFlags::FinalizeMask; }
	__forceinline bool isWeak() const						{ return (m_dwFlags & OTEFlags::WeakMask) == OTEFlags::WeakMask; }
	__forceinline bool isNullTerminated() const				{ return (m_dwFlags & OTEFlags::WeakMask) == OTEFlags::WeakOrZMask; }
	__forceinline void beNullTerminated()					{ ASSERT(!isImmutable()); setNullTerminated(); m_size -= NULLTERMSIZE; }
	__forceinline void setNullTerminated()					{ m_dwFlags = (m_dwFlags & ~OTEFlags::PointerMask) | OTEFlags::WeakOrZMask; }

	__forceinline bool isBehavior() const					{ return isMetaclass() || m_oteClass->isMetaclass(); }
	__forceinline bool isMetaclass() const					{ return m_oteClass == Pointers.ClassMetaclass; }

	__forceinline bool isNil() const						{ return Oop(this) == Oop(Pointers.Nil); }
	__forceinline OTEFlags::Spaces heapSpace() const		{ return static_cast<OTEFlags::Spaces>(m_flags.m_space); }
	__forceinline bool flagsAllMask(BYTE mask) const		{ return (m_ubFlags & mask) == mask; }

	__forceinline hash_t identityHash()
	{
		// This needs to be a loop in case nextIdentityHash ever returns zero
		while (m_idHash == 0)
		{
			m_idHash = ObjectMemory::nextIdentityHash();
		}
		return m_idHash;
	}

public:
	T*				m_location;					// Pointer to array of elements which is the object
	BehaviorOTE*	m_oteClass;					// Class Oop
	// Size is now in the OTE too, if zero then m_location should be NULL
	size_t 			m_size;						// In practice max size is maximum positive SmallInteger

	union
	{
		struct 
		{
			union
			{
				OTEFlags	m_flags;					// 8-bits of flags
				BYTE		m_ubFlags;
			};
			count_t		m_count;
			hash_t		m_idHash;						// identity hash value (16-bit)
		};
		uintptr_t m_dwFlags;
	};
};

#define isIntegerObject(objectPointer)	(((uintptr_t)(objectPointer)) & 1)
#define integerObjectOf(value) 			((Oop)(((SMALLINTEGER)(value) << 1) | 1))
// Cast to signed value necessary to preserve sign correctly when shifting
#define integerValueOf(objectPointer) 	(((SMALLINTEGER)(objectPointer)) >> 1)
#define isIntegerValue(valueWord)		((SMALLINTEGER(valueWord) ^ (SMALLINTEGER(valueWord)<<1)) >= 0)
//#define isIntegerValue(valueWord)		(SMALLINTEGER(valueWord) >= MinSmallInteger && SMALLINTEGER(valueWord) <= MaxSmallInteger)
#define isPositiveIntegerValue(valueWord) ((uintptr_t)(valueWord) <= MaxSmallInteger)

// SmallInteger constants
#define MinusOnePointer -1 /*(integerObjectOf(-1))*/
#define ZeroPointer 1 /*(integerObjectOf(0))*/
#define OnePointer 3 /*(integerObjectOf(1))*/
#define TwoPointer 5 /*(integerObjectOf(2))*/
#define ThreePointer 7 /*(integerObjectOf(3))*/

#include "STObject.h"
typedef TOTE<ST::Object> OTE;
typedef TOTE<void>* OOP;
#ifndef POTE_DEFINED
typedef OTE* POTE;
#define POTE_DEFINED
#endif

std::wostream& operator<<(std::wostream& stream, const OTE*);

template <class T> inline void NilOutPointer(TOTE<T>*& ote)
{
	ote->countDown();
	ote = reinterpret_cast<TOTE<T>*>(Pointers.Nil);
}
