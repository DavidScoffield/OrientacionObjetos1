Class {
	#name : #Triangle,
	#superclass : #Object,
	#instVars : [
		'vertex1',
		'vertex2',
		'vertex3'
	],
	#category : #'Objetos1-Triangle-Ejer22'
}

{ #category : #'instance creation' }
Triangle class >> withPoints: v1 and: v2 and: v3 [
	^ self new
		initializeWithPoints: v1 and: v2 and: v1;
		yourself
]

{ #category : #queries }
Triangle >> area [
	| a b c sP |
	a := self longitudEntre: vertex1 y: vertex2.
	b := self longitudEntre: vertex2 y: vertex3.
	c := self longitudEntre: vertex3 y: vertex1.
	sP := self calcularSPConA: a b: b c: c.
	^ (sP * (sP - a) * (sP - b) * (sP - c)) sqrt
]

{ #category : #private }
Triangle >> calcularLadoA [
	^ self longitudEntre: vertex1 y: vertex2 

]

{ #category : #private }
Triangle >> calcularLadoB [
	^ self longitudEntre: vertex2 y: vertex3 

]

{ #category : #private }
Triangle >> calcularLadoC [
	^ self longitudEntre: vertex3 y: vertex1 

]

{ #category : #private }
Triangle >> calcularSPConA: a b: b c: c [
	^ (a + b + c) / 2
]

{ #category : #initialization }
Triangle >> initializeWithPoints: v1 and: v2 and: v3 [
	vertex1 := v1.
	vertex2 := v2.
	vertex3 := v3
]

{ #category : #testing }
Triangle >> isNeighborElement: otroTriangulo [
	| orde1 orde2 |
	orde1 := OrderedCollection new.
	orde1
		add: vertex1;
		add: vertex2;
		add: vertex3.
	orde2 := OrderedCollection new.
	orde2
		add: otroTriangulo vertex1;
		add: otroTriangulo vertex2;
		add: otroTriangulo vertex3.
	^ orde1 anySatisfy: [ :vT1 | orde2 anySatisfy: [ :vT2 | vT1 = vT2 ] ]
]

{ #category : #private }
Triangle >> longitudEntre: point1 y: point2 [
	^ point1 distanceTo: point2
]

{ #category : #queries }
Triangle >> perimetro [
	| a b c |
	a := self calcularLadoA .
	b := self calcularLadoB .
	c := self calcularLadoC .
	^ a + b + c
]

{ #category : #accesing }
Triangle >> vertex1 [
	^vertex1 
]

{ #category : #accesing }
Triangle >> vertex2 [
	^vertex2
]

{ #category : #accesing }
Triangle >> vertex3 [
	^vertex3
]
