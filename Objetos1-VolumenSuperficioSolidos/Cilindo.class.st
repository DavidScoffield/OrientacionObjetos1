Class {
	#name : #Cilindo,
	#superclass : #Pieza,
	#instVars : [
		'radio',
		'altura'
	],
	#category : #'Objetos1-VolumenSuperficioSolidos'
}

{ #category : #accessing }
Cilindo >> altura: unaAltura [
	altura := unaAltura 
]

{ #category : #accessing }
Cilindo >> radio: unRadio [
	radio := unRadio
]

{ #category : #accessing }
Cilindo >> superficie [
	^ 2 * Float pi * radio * altura + (2 * Float pi * radio squared)
]

{ #category : #accessing }
Cilindo >> volumen [
	^ Float pi * radio squared * altura
]
