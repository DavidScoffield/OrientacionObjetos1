Class {
	#name : #TestFarola,
	#superclass : #TestCase,
	#instVars : [
		'farolaUno',
		'farolaDos'
	],
	#category : #'Objetos1-FarolasSkeleton'
}

{ #category : #running }
TestFarola >> setUp [
   farolaUno := Farola new.
   farolaDos := Farola new.

]

{ #category : #testing }
TestFarola >> testConstructor [
	self deny: farolaUno isOn.
	self assert: farolaUno neighbors isEmpty
]

{ #category : #testing }
TestFarola >> testPairWithNeighbor [
	farolaUno pairWithNeighbor: farolaDos.
	self assert: (farolaUno neighbors includes: farolaDos).
	self assert: (farolaDos neighbors includes: farolaUno)
]

{ #category : #testing }
TestFarola >> testTurnOnAndOff [
	farolaUno pairWithNeighbor: farolaDos .
	farolaUno turnOn.
	self assert: farolaUno isOn.
	self assert: farolaDos isOn.
	farolaUno turnOff .
	self deny: farolaUno isOn.
	self deny: farolaDos isOn.
]
