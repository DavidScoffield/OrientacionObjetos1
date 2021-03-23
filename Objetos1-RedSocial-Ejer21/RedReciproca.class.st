Class {
	#name : #RedReciproca,
	#superclass : #Red,
	#category : #'Objetos1-RedSocial-Ejer21'
}

{ #category : #operations }
RedReciproca >> conectarPersona: pers1 con: pers2 [
	pers1 conocerA: pers2.
	pers2 conocerA: pers1.
]
