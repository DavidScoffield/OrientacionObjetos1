Class {
	#name : #ClientePersonaFisica,
	#superclass : #Cliente,
	#instVars : [
		'dni'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
ClientePersonaFisica class >> newConNombre: nombre direccion: direccion telefono: telefono dni: dni [
	^ (self newConNombre: nombre direccion: direccion telefono: telefono)
		initializeConDni: dni;
		yourself
]

{ #category : #accessing }
ClientePersonaFisica >> descuento [ 
	^0.9
]

{ #category : #accessing }
ClientePersonaFisica >> initializeConDni: unDni [
	dni:= unDni .
]
