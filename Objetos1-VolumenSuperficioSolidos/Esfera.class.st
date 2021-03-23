Class {
	#name : #Esfera,
	#superclass : #Pieza,
	#instVars : [
		'radio'
	],
	#category : #'Objetos1-VolumenSuperficioSolidos'
}

{ #category : #accessing }
Esfera >> radio: unRadio [
	radio:= unRadio 
]

{ #category : #accessing }
Esfera >> superficie [
	^ 4 * Float pi * radio squared 
]

{ #category : #accessing }
Esfera >> volumen [
	^ (4 / 3) * (Float pi) * (radio raisedTo: 3)
]
