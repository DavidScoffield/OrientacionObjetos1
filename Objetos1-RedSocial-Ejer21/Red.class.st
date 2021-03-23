Class {
	#name : #Red,
	#superclass : #Object,
	#instVars : [
		'personas'
	],
	#category : #'Objetos1-RedSocial-Ejer21'
}

{ #category : #operations }
Red >> agregarPersona: persona [
	personas add: persona
]

{ #category : #operations }
Red >> conectarPersona: pers1 con: pers2 [
	self subclassResponsibility 
]

{ #category : #queries }
Red >> egoNetworkDe: persona conProfundidad: profundidad [
	^persona egoNetworkconProfundidad: profundidad  
]

{ #category : #queries }
Red >> histogramaDeEdades [
	| bag |
	bag := Bag new.
	bag addAll: (personas collect: [ :persona | persona edad ]).
	^ bag valuesAndCounts
]

{ #category : #queries }
Red >> inDegree: persona [
	^ (self obtenerLosQueConocenA: persona) size
]

{ #category : #initialization }
Red >> initialize [ 	
	personas := OrderedCollection new.
]

{ #category : #queries }
Red >> obtenerConocidosDe: persona [ 	
	^persona conocidos
]

{ #category : #queries }
Red >> obtenerLosQueConocenA: unaPersona [ 	
	^personas select: [ :persona | persona conoceA: unaPersona ]
]

{ #category : #queries }
Red >> outDegree: persona [
	^ (self obtenerConocidosDe: persona) size
]

{ #category : #accessing }
Red >> personas [
	^personas 
]
