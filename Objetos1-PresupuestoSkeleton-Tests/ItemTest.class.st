Class {
	#name : #ItemTest,
	#superclass : #TestCase,
	#instVars : [
		'item'
	],
	#category : #'Objetos1-PresupuestoSkeleton-Tests'
}

{ #category : #running }
ItemTest >> setUp [
	item := Item new.
	item costoUnitario: 25.
	item cantidad: 2.
	item detalle: 'Porotos'
]

{ #category : #testing }
ItemTest >> testCosto [
	self assert: item costo equals: 50.

]

{ #category : #testing }
ItemTest >> testCostoUnitario [
	self assert: item costoUnitario equals: 25.

]
