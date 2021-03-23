Class {
	#name : #FilteredSet,
	#superclass : #Set,
	#instVars : [
		'condition'
	],
	#category : #'Objetos1-FilteredSet'
}

{ #category : #'instance creation' }
FilteredSet class >> condition: aBlock [ 
	^ FilteredSet new initializeWithCondition: aBlock 
]

{ #category : #adding }
FilteredSet >> add: newObject [ 
	(condition value: newObject) ifTrue: [ super add: newObject  ] .
	^ newObject .
]

{ #category : #initialization }
FilteredSet >> initializeWithCondition: aBlock [ 
	condition := aBlock
]
