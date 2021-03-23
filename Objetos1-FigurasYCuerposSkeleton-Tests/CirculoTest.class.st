Class {
	#name : #CirculoTest,
	#superclass : #TestCase,
	#instVars : [
		'unCirculoTipico'
	],
	#category : #'Objetos1-FigurasYCuerposSkeleton-Tests'
}

{ #category : #tests }
CirculoTest >> setUp [
	unCirculoTipico := Circulo new
		radio: 3;
		yourself
]

{ #category : #tests }
CirculoTest >> testArea [
	"#assert:closeTo: busca que sean iguales hasta el 4to decimal"

	self assert: unCirculoTipico area closeTo: 28.2743
]

{ #category : #tests }
CirculoTest >> testDiametro [
	self assert: unCirculoTipico diametro equals: 6
]

{ #category : #tests }
CirculoTest >> testPerimetro [
	self assert: unCirculoTipico perimetro closeTo: 18.8495
]

{ #category : #tests }
CirculoTest >> testRadio [
	self assert: unCirculoTipico radio equals: 3
]
