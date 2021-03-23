Class {
	#name : #JobSchedulerRefactoredFIFO,
	#superclass : #JobSchedulerRefactored,
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #accessing }
JobSchedulerRefactoredFIFO >> next [
	| next |
	next := self jobs first.
	self unschedule: next.
	^ next
]
