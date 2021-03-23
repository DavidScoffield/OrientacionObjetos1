Class {
	#name : #MamiferoTest,
	#superclass : #TestCase,
	#instVars : [
		'nala',
		'melquiades',
		'mufasa',
		'alexa',
		'elsa',
		'scar',
		'sarabi',
		'anonimo'
	],
	#category : #'Objetos1-GenealogiaAnimalSkeleton'
}

{ #category : #running }
MamiferoTest >> setUp [
	nala := Mamifero new.
	nala identificador: 'Nala'.
	melquiades := Mamifero new.
	melquiades identificador: 'Melquiades'.
	mufasa := Mamifero new.
	mufasa identificador: 'Mufasa'.
	alexa := Mamifero new.
	alexa identificador: 'Alexa'.
	elsa := Mamifero new.
	elsa identificador: 'Elsa'.
	scar := Mamifero new.
	scar identificador: 'Scar'.
	sarabi := Mamifero new.
	sarabi identificador: 'Sarabi'.
	anonimo := Mamifero new.
	alexa padre: mufasa.
	alexa madre: sarabi.
	mufasa padre: melquiades.
	mufasa madre: nala.
	sarabi padre: scar.
	sarabi madre: elsa
]

{ #category : #testing }
MamiferoTest >> testAbuelaMaterna [
	self assert: alexa abuelaMaterna == elsa
]

{ #category : #testing }
MamiferoTest >> testAbuelaPaterna [
	self assert: alexa abuelaPaterna == nala
]

{ #category : #testing }
MamiferoTest >> testAbueloMaterno [
	self assert: alexa abueloMaterno == scar
]

{ #category : #testing }
MamiferoTest >> testAbueloPaterno [
	self assert: alexa abueloPaterno == melquiades
]

{ #category : #testing }
MamiferoTest >> testEspecie [
	anonimo  especie: 'Panthera leo'.
	self assert: anonimo especie equals: 'Panthera leo'
]

{ #category : #testing }
MamiferoTest >> testIdentificador [
	anonimo identificador: 'Nala'.
	self assert: anonimo identificador equals: 'Nala'
]

{ #category : #testing }
MamiferoTest >> testMadre [
	anonimo madre: alexa .
	self assert: anonimo madre == alexa 
]

{ #category : #testing }
MamiferoTest >> testPadre [
	anonimo padre: mufasa.
	self assert: anonimo padre == mufasa
]

{ #category : #testing }
MamiferoTest >> testTieneAncestro [
	self deny: (nala tieneAncestro: anonimo).
	self deny: (mufasa tieneAncestro: anonimo).
	self deny: (alexa tieneAncestro: anonimo).
	self deny: (alexa tieneAncestro: alexa).
	self assert: (alexa tieneAncestro: mufasa).
	self assert: (alexa tieneAncestro: sarabi).
	self assert: (alexa tieneAncestro: nala).
	self assert: (alexa tieneAncestro: melquiades).
	self assert: (alexa tieneAncestro: elsa).
	self assert: (alexa tieneAncestro: scar)
]
