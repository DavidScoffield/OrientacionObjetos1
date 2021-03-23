Class {
	#name : #GephooTest,
	#superclass : #TestCase,
	#instVars : [
		'red',
		'gephoo'
	],
	#category : #'Objetos1-RedSocial-Ejer21-Test'
}

{ #category : #running }
GephooTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	gephoo:= Gephoo new.
	red:= RedReciproca new.
]

{ #category : #tests }
GephooTest >> testAgregarPersona [
	| persona |
	persona := PersonaRed newConNombre: 'david' apellido: 'sco' edad: 19.
	gephoo establecerRed: red.
	
	self deny: (gephoo red personas includes: persona).
	
	gephoo agregarPersona: persona.
	
	self assert: (gephoo red personas includes: persona)
]

{ #category : #tests }
GephooTest >> testEstablecerRed [
	gephoo establecerRed: red.
	self assert: gephoo red = red. 
]
