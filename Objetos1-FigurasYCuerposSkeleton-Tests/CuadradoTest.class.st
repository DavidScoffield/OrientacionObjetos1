Class {
	#name : #CuadradoTest,
	#superclass : #TestCase,
	#instVars : [
		'unCuadradoTipico'
	],
	#category : #'Objetos1-FigurasYCuerposSkeleton-Tests'
}

{ #category : #initialization }
CuadradoTest >> setUp [
	unCuadradoTipico := Cuadrado new
		lado: 3;
		yourself
]

{ #category : #initialization }
CuadradoTest >> testArea [
	self assert: unCuadradoTipico area equals: 9
]

{ #category : #initialization }
CuadradoTest >> testLado [
	self assert: unCuadradoTipico lado equals: 3
]

{ #category : #initialization }
CuadradoTest >> testPerimetro [
	self assert: unCuadradoTipico perimetro equals: 12
]
