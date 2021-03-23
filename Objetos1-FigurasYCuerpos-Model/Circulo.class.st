Class {
	#name : #Circulo,
	#superclass : #Object,
	#instVars : [
		'diametro'
	],
	#category : #'Objetos1-FigurasYCuerpos-Model'
}

{ #category : #accessing }
Circulo >> area [
	^ Float pi * (self radio squared)
]

{ #category : #accessing }
Circulo >> diametro [
	^diametro 
]

{ #category : #accessing }
Circulo >> diametro: valorDiametro [
	diametro := valorDiametro. 

]

{ #category : #queries }
Circulo >> perimetro [
	^(Float pi * diametro ) 
]

{ #category : #queries }
Circulo >> radio [
	^diametro/2
]

{ #category : #accessing }
Circulo >> radio: aRadio [
	"radio := aRadio."
	diametro := aRadio * 2.
]
