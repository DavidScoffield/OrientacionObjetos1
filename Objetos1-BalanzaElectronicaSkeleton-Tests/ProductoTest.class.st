Class {
	#name : #ProductoTest,
	#superclass : #TestCase,
	#instVars : [
		'queso'
	],
	#category : #'Objetos1-BalanzaElectronicaSkeleton-Tests'
}

{ #category : #running }
ProductoTest >> setUp [
	queso := Producto new.

]

{ #category : #testing }
ProductoTest >> testDescripcion [
	queso descripcion: 'Queso crema'.
	self assert: queso descripcion equals: 'Queso crema'
]

{ #category : #testing }
ProductoTest >> testPeso [
	queso peso: 100.
	self assert: queso peso equals: 100
]

{ #category : #testing }
ProductoTest >> testPrecio [
	queso
		peso: 0.1;
		precioPorKilo: 140.
	self assert: queso precio equals: 14
]

{ #category : #testing }
ProductoTest >> testPrecioPorKilo [
	queso precioPorKilo: 100.
	self assert: queso precioPorKilo equals: 100
]
