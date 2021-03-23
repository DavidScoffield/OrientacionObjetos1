Class {
	#name : #JobSchedulerRefactoredLIFO,
	#superclass : #JobSchedulerRefactored,
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #accessing }
JobSchedulerRefactoredLIFO >> next [
	| next |
	next := self jobs last.
	self unschedule: next.
	^ next
]
