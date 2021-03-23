Class {
	#name : #ClientePersonaJuridica,
	#superclass : #Cliente,
	#instVars : [
		'cuit',
		'tipoPersonaJuridica'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
ClientePersonaJuridica class >> newConNombre: nombre direccion: direccion telefono: telefono cuit: cuit tipo: tipoPersonaJuridica [
	^ (self newConNombre: nombre direccion: direccion telefono: telefono)
		initializeConCuit: cuit tipo: tipoPersonaJuridica;
		yourself
]

{ #category : #initialization }
ClientePersonaJuridica >> initializeConCuit: unCuit tipo: unTipo [
	cuit := unCuit .
	tipoPersonaJuridica := unTipo 
]
