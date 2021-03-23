Class {
	#name : #JobSchedulerTestRefactored,
	#superclass : #TestCase,
	#instVars : [
		'firstJob',
		'highestPriorityJob',
		'mostEffortJob',
		'lastJob'
	],
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #private }
JobSchedulerTestRefactored >> initializieJobs [
	firstJob := JobDescriptionRefactored  new.
	firstJob
		priority: 1;
		description: 'Este es el primero';
		effort: 1.
	highestPriorityJob := JobDescriptionRefactored new.
	highestPriorityJob
		priority: 100;
		description: 'Este es el de mas prioridad';
		effort: 1.
	mostEffortJob := JobDescriptionRefactored new.
	mostEffortJob
		priority: 1;
		description: 'Este es el de mas prioridad';
		effort: 100.
	lastJob := JobDescriptionRefactored new.
	lastJob
		priority: 1;
		description: 'Este es el de mas prioridad';
		effort: 1
]

{ #category : #private }
JobSchedulerTestRefactored >> scheduleJobsIn: aScheduler [
	aScheduler
		schedule: firstJob;
		schedule: highestPriorityJob;
		schedule: mostEffortJob;
		schedule: lastJob
]

{ #category : #running }
JobSchedulerTestRefactored >> setUp [
	self initializieJobs.

]

{ #category : #testing }
JobSchedulerTestRefactored >> testNext [
	| scheduler |
	scheduler := JobSchedulerRefactoredFIFO new.
	self scheduleJobsIn: scheduler.
	self assert: scheduler next == firstJob.
	self assert: scheduler jobs size == 3.
	
	scheduler := JobSchedulerRefactoredLIFO new.
	self scheduleJobsIn: scheduler.
	self assert: scheduler next == lastJob.
	self assert: scheduler jobs size == 3.
	
	scheduler := JobSchedulerRefactoredPriority new.
	self scheduleJobsIn: scheduler.
	self assert: scheduler next == highestPriorityJob.
	self assert: scheduler jobs size == 3.
	
	scheduler := JobSchedulerRefactoredMostEffortFirst new.
	self scheduleJobsIn: scheduler.
	self assert: scheduler next == mostEffortJob.
	self assert: scheduler jobs size == 3
]

{ #category : #testing }
JobSchedulerTestRefactored >> testSchedule [
	| scheduler |
	scheduler := JobSchedulerRefactored new.
	scheduler schedule: highestPriorityJob.
	self assert: (scheduler jobs includes: highestPriorityJob )
]

{ #category : #testing }
JobSchedulerTestRefactored >> testUnschedule [
	| scheduler |
	scheduler := JobSchedulerRefactored new.
	self scheduleJobsIn: scheduler.
	scheduler unschedule: highestPriorityJob.
	self deny: (scheduler jobs includes: highestPriorityJob)
]
