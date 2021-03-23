Class {
	#name : #Farola,
	#superclass : #Object,
	#instVars : [
		'on',
		'neighbors'
	],
	#category : #'Objetos1-Farolas'
}

{ #category : #initialization }
Farola >> initialize [ 
	on:= false.
	neighbors := OrderedCollection new.
	
]

{ #category : #accesing }
Farola >> isOn [ 	
	^on
]

{ #category : #accesing }
Farola >> neighbors [
	^neighbors 
]

{ #category : #operations }
Farola >> pairWithNeighbor: otraFarola [
	(neighbors includes: otraFarola)
		ifFalse: [ neighbors add: otraFarola .
			otraFarola pairWithNeighbor: self ]
]

{ #category : #operations }
Farola >> turnOff [
	on
		ifTrue: [ on := on not.
			neighbors do: [ :each | each turnOff ] ]
]

{ #category : #operations }
Farola >> turnOn [
	on
		ifFalse: [ on := on not.
			neighbors do: [ :each | each turnOn ] ]
]
