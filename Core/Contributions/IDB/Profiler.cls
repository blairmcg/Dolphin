﻿"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Profiler
	instanceVariableNames: 'samplingInterval isSampling mutex'
	classVariableNames: 'Default'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Profiler guid: (GUID fromString: '{425d0ead-542e-11d3-998b-d5ca2c3c1d61}')!
Profiler comment: 'See [DolphinImageFolder]/Idb/Documentation for details

(C) 2005 Ian Bartholomew
ian@idb.me.uk
Public Domain Freeware'!
!Profiler categoriesForClass!IDB Goodies! !
!Profiler methodsFor!

initialize
	"Initialize the singleton instance of this class"

	samplingInterval := Delay highestResolution.
	isSampling := true.
	mutex := Mutex new.
	^self!

profile: aProcess forSet: aProfilerSampleSet ignoring: anInteger
	"This is the main profiling method. While the sample set is active, i.e. the process
	being profiled is still alive,  collect stack frames at appropriate intervals and save 
	them in the sample set. The mutex allows multiple processes to be profiled
	at the sume time, as long as they use different sample sets"

	Delay resolution: samplingInterval
		do: 
			[
			[| started elapsed |
			started := Time microsecondClockValue.
			(Delay forMicroseconds: samplingInterval) wait.
			elapsed := Time microsecondClockValue - started.
			(isSampling and: [aProfilerSampleSet isActive])
				ifTrue: 
					[mutex critical: 
							[self
								sampleProcess: aProcess
								forSet: aProfilerSampleSet
								elapsedTime: elapsed
								ignoring: anInteger]].
			aProfilerSampleSet isActive]
					whileTrue]!

profile: aBlock inSetNamed: aString collect: collectBoolean on: onBoolean 
	"Profile aBlock storing the results in the sample set named aString which will be cleared 
	first if collectBoolean is false.. If onBoolean is true we satrt taking samples straight away
	(after the first timing interval) otherwise we wait until a startSampling instruction is executed.
	The profiler is given its own process with a priority slightly higher than the process being
	profiled. Profiling continues until the profiled block terminates. Multiple profiling
	process can be started with the results of each being saved in a different sample set. If a
	profile is already in progress for the requested sample set then no new profile is started..
	Answers the result of evaluating the profiled block"

	| sampleSet thisProcess ignoreFrames semaphore answer |
	sampleSet := ProfilerSampleSetManager default sampleSetNamed: aString.
	(sampleSet notNil and: [sampleSet isActive]) ifTrue: [^self].
	sampleSet isNil ifTrue: [sampleSet := ProfilerSampleSetManager default addSampleSetNamed: aString].
	collectBoolean ifFalse: [sampleSet initialize].
	sampleSet
		clearCaches;
		isActive: true.
	isSampling := onBoolean.
	thisProcess := Processor activeProcess.
	ignoreFrames := (thisProcess stackDepthFrom: thisProcess topFrame) + 5.
	semaphore := Semaphore new.
	
	[semaphore wait.
	self 
		profile: thisProcess
		forSet: sampleSet
		ignoring: ignoreFrames.
	semaphore signal] 
			forkAt: thisProcess priority + 1.
	
	[semaphore signal.
	answer := [[aBlock value] value] value] ensure: 
				[sampleSet isActive: false.
				semaphore wait.
				sampleSet update].
	^answer!

sampleProcess: aProcess forSet: aProfilerSampleSet elapsedTime: anInteger ignoring: ignoreInteger
	"Add the required stack frames to the sample set"

	| topFrame size |
	topFrame := aProcess topFrame.
	size := (aProcess stackDepthFrom: topFrame) - ignoreInteger.
	size > 0 ifTrue: [aProfilerSampleSet addSample: (topFrame getFrames: size) elapsedTime: anInteger]!

samplingInterval: anInteger 
	"Set the sampling interval, the delay between samples being taken, to anInteger"

	samplingInterval := anInteger!

startSampling
	"Set the state of the isSampling flag to true. If a profile is in progress the change in
	state of the flag will be noticed by the main profiling process and it will start sampling"

	isSampling := true!

stopSampling
	"Set the state of the isSampling flag to trufalse. If a profile is in progress the change in
	state of the flag will be noticed by the main profiling process and it will start sampling"

	isSampling := false! !
!Profiler categoriesFor: #initialize!initializing!public! !
!Profiler categoriesFor: #profile:forSet:ignoring:!profiling!public! !
!Profiler categoriesFor: #profile:inSetNamed:collect:on:!operations!public! !
!Profiler categoriesFor: #sampleProcess:forSet:elapsedTime:ignoring:!profiling!public! !
!Profiler categoriesFor: #samplingInterval:!operations!public! !
!Profiler categoriesFor: #startSampling!operations!public! !
!Profiler categoriesFor: #stopSampling!operations!public! !

!Profiler class methodsFor!

default
	"Private - Answer the singleton instance of this class"

	Default isNil ifTrue: [Default := super new initialize].
	^Default!

new
	"Private - Use default to get the Singleton instance"

	^self shouldNotImplement!

openBrowser
	"Open up an ProfileBrowser on the singleton instance of the profiler.
	Multiple browsers can be opened if required"

	ProfileBrowser showOn: self default!

profile: aBlock 
	"Profile aBlock, saving the samples in the default sample set after clearing any previous
	samples stored in the default sample set.
	Answers the answer returned by the aBlock when it is evaluated"

	^self profile: aBlock inSetNamed: ProfilerSampleSetManager defaultSetName!

profile: aBlock inSetNamed: aString 
	"Profile aBlock, saving the samples in the a sample set named aString after clearing any
	previous samples stored in the this sample set.
	Answers the answer returned by the aBlock when it is evaluated"

	^self 
		profile: aBlock
		inSetNamed: aString
		collect: false!

profile: aBlock inSetNamed: aString collect: aBoolean 
	"Profile aBlock, saving the samples in the a sample set named aString. If aBoolean is true
	the new samples are added to any samples already existing in the sample set.
	Answers the answer returned by the aBlock when it is evaluated"

	^self 
		profile: aBlock
		inSetNamed: aString
		collect: aBoolean
		on: true!

profile: aBlock inSetNamed: aString collect: collectBoolean on: onBoolean 
	"Profile aBlock, saving the samples in the a sample set named aString. If collectBoolean is true
	the new samples are added to any samples already existing in the sample set. If onBoolean
	is true then the taking of samples start immediately, otherwise no samples are taken until a
	Profiler profilingOn instruction is executed.	
	Answers the answer returned by the aBlock when it is evaluated"

	^self default 
		profile: aBlock
		inSetNamed: aString
		collect: collectBoolean
		on: onBoolean!

removeAllSampleSets
	"Remove all the sample sets"

	ProfilerSampleSetManager default removeAll!

removeSampleSetNamed: aString 
	"Remove the sample set named aString"

	^ProfilerSampleSetManager removeSampleSetNamed: aString!

reset
	"Reset the singleton instance so that it will be reinitialized. Should only need to be 
	used when the profiler package is uninstalled - but you never know"

	Default := nil!

samplingInterval: anInteger 
	"Set the sampling interval, the delay between samples being taken, to anInteger"

	self default samplingInterval: anInteger!

startSampling
	"Tells the profiler to satrt taking samples and to continue until either the processed 
	block terminates or a stopSampling instruction is executed"

	self default startSampling!

stopSampling
	"Tells the profiler to stop taking samples until a startSampling instruction is executed"

	self default stopSampling! !
!Profiler class categoriesFor: #default!instance creation!public! !
!Profiler class categoriesFor: #new!instance creation!protocols-instantiator!protocols-Object class!public! !
!Profiler class categoriesFor: #openBrowser!operations!public! !
!Profiler class categoriesFor: #profile:!operations!public! !
!Profiler class categoriesFor: #profile:inSetNamed:!operations!public! !
!Profiler class categoriesFor: #profile:inSetNamed:collect:!operations!public! !
!Profiler class categoriesFor: #profile:inSetNamed:collect:on:!operations!public! !
!Profiler class categoriesFor: #removeAllSampleSets!operations!public! !
!Profiler class categoriesFor: #removeSampleSetNamed:!operations!public! !
!Profiler class categoriesFor: #reset!operations!public! !
!Profiler class categoriesFor: #samplingInterval:!operations!public! !
!Profiler class categoriesFor: #startSampling!operations!public! !
!Profiler class categoriesFor: #stopSampling!operations!public! !
