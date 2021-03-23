Class {
	#name : #Inversor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'inversiones'
	],
	#category : #'Objetos1-ElInversor'
}

{ #category : #initialization }
Inversor >> initialize [ 	
	inversiones := OrderedCollection new.
]

{ #category : #operations }
Inversor >> nombre [
	^nombre
]

{ #category : #operations }
Inversor >> nombre: unNombre [
	nombre := unNombre 
]

{ #category : #operations }
Inversor >> valorActual [
	^inversiones sumNumbers: [ :inversion | inversion valorActual ]
]
