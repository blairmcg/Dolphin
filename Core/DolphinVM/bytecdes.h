/*
==========
bytecdes.h
==========
Dolphin Instruction Set
*/
#pragma once

///////////////////////
// Instruction Set

constexpr uint8_t NumShortPushInstVars = 16;
constexpr uint8_t NumShortPushTemps = 8;
constexpr uint8_t NumPushContextTemps = 2;
constexpr uint8_t NumPushOuterTemps = 2;
constexpr uint8_t NumShortPushConsts = 16;
constexpr uint8_t NumShortPushStatics = 12;
constexpr uint8_t NumShortPushSelfAndTemps = 4;
constexpr uint8_t NumShortStoreTemps = 4;
constexpr uint8_t NumPopStoreContextTemps = 2;
constexpr uint8_t NumPopStoreOuterTemps = 2;
constexpr uint8_t NumShortPopStoreInstVars = 8;
constexpr uint8_t NumShortPopStoreTemps = 8;
constexpr uint8_t NumShortJumps = 8;
constexpr uint8_t NumShortJumpsIfFalse = 8;
constexpr uint8_t NumArithmeticSelectors = 16;
constexpr uint8_t NumCommonSelectors = 16;
constexpr uint8_t NumSpecialSelectors = NumArithmeticSelectors+NumCommonSelectors;
constexpr uint8_t NumShortSendsWithNoArgs = 13;
constexpr uint8_t NumShortSendSelfWithNoArgs = 5;
constexpr uint8_t NumShortSendsWith1Arg = 14;
constexpr uint8_t NumShortSendsWith2Args = 8;

// N.B. These sizes are offsets from the instruction FOLLOWING the jump (the IP is assumed to
// have advanced to the next instruction by the time the offset is added to IP)
static constexpr int MaxBackwardsLongJump = INT16_MIN;
static constexpr int MaxForwardsLongJump = INT16_MAX;
static constexpr int MaxBackwardsNearJump = INT8_MIN;
static constexpr int MaxForwardsNearJump = INT8_MAX;

constexpr uint8_t FirstSingleByteInstruction = 0;
constexpr uint8_t FirstDoubleByteInstruction = 204;
constexpr uint8_t FirstTripleByteInstruction = 234;
constexpr uint8_t FirstMultiByteInstruction = 252;

enum {	Break = FirstSingleByteInstruction,
		FirstShortPush };

enum {	ShortPushInstVar = FirstShortPush };
enum {	ShortPushTemp = ShortPushInstVar + NumShortPushInstVars };
enum {	ShortPushContextTemp = ShortPushTemp + NumShortPushTemps };
enum {	ShortPushOuterTemp = ShortPushContextTemp + NumPushContextTemps };
enum {	ShortPushConst = ShortPushOuterTemp + NumPushOuterTemps };
enum {	ShortPushStatic = ShortPushConst + NumShortPushConsts };
enum {
	LastShortPush = ShortPushStatic + NumShortPushStatics - 1,
	FirstPseudoPush
	};

enum { ShortPushSelf = FirstPseudoPush, ShortPushTrue, ShortPushFalse, ShortPushNil };		// Push pseudo variable

enum { 
	LastPseudoPush = ShortPushNil,
	ShortPushMinusOne, ShortPushZero, ShortPushOne, ShortPushTwo,			// Short push immediates
	ShortPushSelfAndTemp };

enum {
	LastPush =  ShortPushSelfAndTemp + NumShortPushSelfAndTemps - 1,
	ShortStoreTemp };

enum { ShortPopPushTemp = ShortStoreTemp + NumShortStoreTemps };
enum { NumShortPopPushTemps = 2 };

enum {PopPushSelf = ShortPopPushTemp + NumShortPopPushTemps,
	PopDup,
	PopStoreContextTemp 
};

enum { ShortPopStoreOuterTemp = PopStoreContextTemp + NumPopStoreContextTemps };
enum { ShortPopStoreInstVar = ShortPopStoreOuterTemp + NumPopStoreOuterTemps };
enum { ShortPopStoreTemp = ShortPopStoreInstVar + NumShortPopStoreInstVars };

enum { 
	PopStackTop = ShortPopStoreTemp + NumShortPopStoreTemps,
	IncrementStackTop,			// push 1; send #+
	DecrementStackTop,			// push 1; send #-
	DuplicateStackTop,
	FirstReturn };
	
enum { FirstPseudoReturn = FirstReturn };
enum {
	ReturnSelf = FirstPseudoReturn, ReturnTrue, ReturnFalse, ReturnNil };
enum {
	LastPseudoReturn = ReturnNil,
	ReturnMessageStackTop, 
	ReturnBlockStackTop,
	FarReturn,
	PopReturnSelf,
	};
enum {
	LastReturn = PopReturnSelf,
	Nop,
	ShortJump };
enum { 
	LastShortJump = ShortJump + NumShortJumps - 1, 
	ShortJumpIfFalse };
enum { FirstShortSend = ShortJumpIfFalse + NumShortJumpsIfFalse };
enum { ShortSpecialSend = FirstShortSend };
enum { 
	SendArithmeticAdd = ShortSpecialSend,
	SendArithmeticSub,
	SendArithmeticLT,
	SendArithmeticGT,
	SendArithmeticLE,
	SendArithmeticGE,
	SendArithmeticEQ,
	SendArithmeticNE,
	SendArithmeticMul,
	SendArithmeticDivide,
	SendArithmeticMod,
	SendArithmeticBitShift,
	SendArithmeticDiv,
	SendArithmeticBitAnd,
	SendArithmeticBitOr };
enum { FirstSpecialSend = SendArithmeticBitOr + 1 };
enum {
	SpecialSendIdentical = FirstSpecialSend,
	SpecialSendValue0,
	SpecialSendValue1,
	SpecialSendClass,
	SpecialSendSize,
	SpecialSendNew,
	SpecialSendNew1,
	SpecialSendAt,
	SpecialSendAtPut,
	SpecialSendValue2,
	SpecialSendBasicNew,
	SpecialSendBasicClass,
	SpecialSendBasicSize,
	SpecialSendBasicAt,
	SpecialSendBasicAtPut,
	SpecialSendIsNil,
	SpecialSendNotNil
	 };
enum { ShortSendWithNoArgs = ShortSpecialSend + NumSpecialSelectors };
enum { ShortSendSelfWithNoArgs = ShortSendWithNoArgs + NumShortSendsWithNoArgs };
enum { ShortSendWith1Arg =  ShortSendSelfWithNoArgs + NumShortSendSelfWithNoArgs };
enum { ShortSendWith2Args =  ShortSendWith1Arg + NumShortSendsWith1Arg };

enum { LastShortSend = ShortSendWith2Args + NumShortSendsWith2Args - 1};
enum {
	IsZero = LastShortSend+1,
	PushActiveFrame,
	SpecialSendNotIdentical,
	SpecialSendNot,
	UnusedShortSend202,
	UnusedShortSend203
};
enum { FirstExSpecialSend = SpecialSendNotIdentical, LastExSpecialSend = UnusedShortSend203 };
enum { NumExSpecialSends = LastExSpecialSend - FirstExSpecialSend + 1 };


// Some unused space before double byte instructions...

enum {
	PushInstVar = FirstDoubleByteInstruction, 
	PushTemp,
	PushConst,
	PushStatic,
	FirstExtendedStore
	};

enum {
	StoreInstVar = FirstExtendedStore,
	StoreTemp,
	StoreStatic,
	};

enum {
	LastExtendedStore = StoreStatic,
	FirstPopStore 
	};

enum {
	PopStoreInstVar = FirstPopStore,
	PopStoreTemp,
	PopStoreStatic
	};

enum {
	LastPopStore = PopStoreStatic,
	PushImmediate,
	PushChar,
	Send,
	Supersend,
	SpecialSend,				// Not implemented yet
	NearJump,
	NearJumpIfTrue,
	NearJumpIfFalse,
	NearJumpIfNil,
	NearJumpIfNotNil,
	ReservedJump224,
	ReservedJump225,
	SendTempWithNoArgs,
	PushSelfAndTemp,
	PushOuterTemp,
	StoreOuterTemp,
	PopStoreOuterTemp,
	SendSelfWithNoArgs,
	PopSendSelfNoArgs,
	PushTempPair};

enum {
	LongPushConst = FirstTripleByteInstruction,
	LongPushStatic,
	LongStoreStatic,
	_unusedTripleByte237,
	LongPushImmediate,
	LongSend,
	LongSupersend,
	LongJump,
	LongJumpIfTrue,
	LongJumpIfFalse,
	LongJumpIfNil,
	LongJumpIfNotNil,
	LongPushOuterTemp,
	LongStoreOuterTemp,
	IncrementTemp,
	IncrementPushTemp,
	DecrementTemp,
	DecrementPushTemp,
	};


enum { 
	BlockCopy = FirstMultiByteInstruction,
	ExLongSend,
	ExLongSupersend,
	ExLongPushImmediate
};


// Offsets for Push and ReturnFromMessage
// These are deliberately reordered from Blue Book to provide most opportunity for packing
// 4 byte code methods into a SmallInteger (which can be done if the first byte is odd).
// Since push receiver is very often the first byte of a short method, the BBB byte code of 112
// is reassigned to 115 (push nil if very infrequently used at the start of a method)
//enum PseudoVars { Nil, True, False, Receiver, NumPseudoVars };
//enum SpecialPushes { MinusOne=NumPseudoVars, Zero, One, Two, NumSpecialPushes };

#define MAXFORBITS(n) ((1 << (n)) - 1)

// Consts for Single extended send instructions
constexpr int SendXArgCountBits 	= 3;
constexpr int SendXMaxArgs	 		= MAXFORBITS(SendXArgCountBits);
constexpr int SendXLiteralBits 		= 8 - SendXArgCountBits;
constexpr int SendXMaxLiteral 		= MAXFORBITS(SendXLiteralBits);

// Consts for double extended send instructions
constexpr int Send2XArgCountBits	= 8;
constexpr int Send2XMaxArgs			= MAXFORBITS(Send2XArgCountBits);
constexpr int Send2XLiteralBits 	= 8;
constexpr int Send2XMaxLiteral		= MAXFORBITS(Send2XLiteralBits);

constexpr int Send3XArgCountBits	= 8;
constexpr int Send3XMaxArgs			= MAXFORBITS(Send3XArgCountBits);
constexpr int Send3XLiteralBits 	= 16;
constexpr int Send3XMaxLiteral		= MAXFORBITS(Send3XLiteralBits);

constexpr int OuterTempIndexBits	= 5;
constexpr int OuterTempMaxIndex		= MAXFORBITS(OuterTempIndexBits);
constexpr int OuterTempDepthBits	= 3;
constexpr int OuterTempMaxDepth		= MAXFORBITS(OuterTempDepthBits);

constexpr int BlockCopyMaxArgs = 255;

#pragma warning(disable:4201)
struct BlockCopyExtension
{
	uint8_t	argCount;
	uint8_t	stackTempsCount;
	uint8_t	needsOuter:1;
	uint8_t	envTempsCount:7;
	uint8_t	needsSelf:1;
	uint8_t	copiedValuesCount:7;
};

enum { ExLongPushImmediateInstructionSize = 5, BlockCopyInstructionSize = 7 };

inline size_t lengthOfByteCode(uint8_t opCode)
{
	return opCode < FirstDoubleByteInstruction ? 1 : 
				opCode < FirstTripleByteInstruction ? 2 : 
					opCode <  FirstMultiByteInstruction ? 3 : 
						opCode == BlockCopy ? BlockCopyInstructionSize : 
							opCode == ExLongPushImmediate ? ExLongPushImmediateInstructionSize : 4;

}
