Class {
	#name : #JobSchedulerRefactoredPriority,
	#superclass : #JobSchedulerRefactored,
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #accessing }
JobSchedulerRefactoredPriority >> next [
	| sortedJobs next |
	sortedJobs := self jobs asSortedCollection: [ :a :b | a priority > b priority ].
	next := sortedJobs removeFirst.
	self unschedule: next.
	^ next
]
