Class {
	#name : #JobDescriptionRefactored,
	#superclass : #Object,
	#instVars : [
		'effort',
		'priority',
		'description'
	],
	#category : #'Objetos1-JobSchedulerRefactored'
}

{ #category : #accessing }
JobDescriptionRefactored >> description [
	^ description
]

{ #category : #accessing }
JobDescriptionRefactored >> description: anObject [
	description := anObject
]

{ #category : #accessing }
JobDescriptionRefactored >> effort [
	^ effort
]

{ #category : #accessing }
JobDescriptionRefactored >> effort: anObject [
	effort := anObject
]

{ #category : #accessing }
JobDescriptionRefactored >> priority [
	^ priority
]

{ #category : #accessing }
JobDescriptionRefactored >> priority: anObject [
	priority := anObject
]
