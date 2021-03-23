Class {
	#name : #ProductoTest2,
	#superclass : #TestCase,
	#instVars : [
		'queso'
	],
	#category : #'Objetos1-BalanzaElectronicaMejoradaSkeleton-Tests'
}

{ #category : #running }
ProductoTest2 >> setUp [
	queso := Producto2 new.

]

{ #category : #testing }
ProductoTest2 >> testDescripcion [
	queso descripcion: 'Queso crema'.
	self assert: queso descripcion equals: 'Queso crema'
]

{ #category : #testing }
ProductoTest2 >> testPeso [
	queso peso: 100.
	self assert: queso peso equals: 100
]

{ #category : #testing }
ProductoTest2 >> testPrecio [
	queso
		peso: 0.1;
		precioPorKilo: 140.
	self assert: queso precio equals: 14
]

{ #category : #testing }
ProductoTest2 >> testPrecioPorKilo [
	queso precioPorKilo: 100.
	self assert: queso precioPorKilo equals: 100
]
