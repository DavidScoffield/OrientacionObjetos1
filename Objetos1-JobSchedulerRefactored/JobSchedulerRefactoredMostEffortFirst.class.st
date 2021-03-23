Class {
	#name : #JobSchedulerRefactoredMostEffortFirst,
	#superclass : #JobSchedulerRefactored,
	#instVars : [
		'next'
	],
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #accessing }
JobSchedulerRefactoredMostEffortFirst >> next [
	| sortedJobs |
	sortedJobs := self jobs asSortedCollection: [ :a :b | a effort > b effort ].
			next := sortedJobs removeFirst.
			self unschedule: next.
			^ next 
]
