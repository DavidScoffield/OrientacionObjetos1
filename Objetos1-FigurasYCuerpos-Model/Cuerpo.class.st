Class {
	#name : #Cuerpo,
	#superclass : #Object,
	#instVars : [
		'altura',
		'caraBasal'
	],
	#category : #'Objetos1-FigurasYCuerpos-Model'
}

{ #category : #accessing }
Cuerpo >> altura [
	^altura 
]

{ #category : #accessing }
Cuerpo >> altura: a [
	altura := a
]

{ #category : #accessing }
Cuerpo >> caraBasal: cara [
	caraBasal := cara
]

{ #category : #queries }
Cuerpo >> superficieExterior [
	^ 2 * caraBasal area + (caraBasal perimetro * altura)
]

{ #category : #queries }
Cuerpo >> volumen [
	^ caraBasal area * altura
]
