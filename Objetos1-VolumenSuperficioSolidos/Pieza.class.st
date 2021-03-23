Class {
	#name : #Pieza,
	#superclass : #Object,
	#instVars : [
		'material',
		'color'
	],
	#category : #'Objetos1-VolumenSuperficioSolidos'
}

{ #category : #accessing }
Pieza >> color [
	^color 
]

{ #category : #accessing }
Pieza >> color: unColor [
	color := unColor 
]

{ #category : #accessing }
Pieza >> material [
	^material
]

{ #category : #accessing }
Pieza >> material: unMaterial [
	material := unMaterial 
]

{ #category : #accessing }
Pieza >> superficie [
	self subclassResponsibility 
]

{ #category : #accessing }
Pieza >> volumen [ 
	self subclassResponsibility 
]
