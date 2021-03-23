Class {
	#name : #Cuadrado,
	#superclass : #Object,
	#instVars : [
		'lado'
	],
	#category : #'Objetos1-FigurasYCuerpos-Model'
}

{ #category : #accessing }
Cuadrado >> area [ 	
	^lado squared 
]

{ #category : #accessing }
Cuadrado >> lado [
	^lado
]

{ #category : #queries }
Cuadrado >> lado: valorLado [
	lado := valorLado 
]

{ #category : #queries }
Cuadrado >> perimetro [
	^lado * 4
]
