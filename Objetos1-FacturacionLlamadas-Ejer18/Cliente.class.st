Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'direccion',
		'telefono'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
Cliente class >> newConNombre: nombre direccion: direccion telefono: telefono [
	^ self new
		initializeConNombre: nombre direccion: direccion telefono: telefono;
		yourself
]

{ #category : #accessing }
Cliente >> descuento [ 	
	^1
]

{ #category : #initialization }
Cliente >> initializeConNombre: unNombre direccion: unaDireccion telefono: unTelefono [ 
	nombre := unNombre .
	direccion := unaDireccion .
	telefono := unTelefono .
]

{ #category : #accessing }
Cliente >> telefono [
	^telefono
]
