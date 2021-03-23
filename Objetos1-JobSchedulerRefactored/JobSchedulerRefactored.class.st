Class {
	#name : #JobSchedulerRefactored,
	#superclass : #Object,
	#instVars : [
		'jobs'
	],
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #initialize }
JobSchedulerRefactored >> initialize [
   jobs := OrderedCollection new. 
]

{ #category : #accessing }
JobSchedulerRefactored >> jobs [
	^ jobs
]

{ #category : #accessing }
JobSchedulerRefactored >> next [
	self subclassResponsibility 
]

{ #category : #schedulling }
JobSchedulerRefactored >> schedule: job [
	jobs add: job
]

{ #category : #schedulling }
JobSchedulerRefactored >> unschedule: job [
	jobs remove: job
]
