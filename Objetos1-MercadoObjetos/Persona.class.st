Class {
	#name : #Persona,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'direccion'
	],
	#category : #'Objetos1-MercadoObjetos'
}

{ #category : #'instance creation' }
Persona class >> newConNombre: unNombre direccion: unaDireccion [
	^ self new
		initializeConNombre: unNombre direccion: unaDireccion;
		yourself
]

{ #category : #accessing }
Persona >> direccion [ 
	^direccion 
]

{ #category : #initialization }
Persona >> initializeConNombre: unNombre direccion: unaDireccion [
	nombre := unNombre.
	direccion := unaDireccion
]

{ #category : #accessing }
Persona >> nombre [
	^ nombre
]
