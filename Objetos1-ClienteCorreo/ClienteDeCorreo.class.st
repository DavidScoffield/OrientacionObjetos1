Class {
	#name : #ClienteDeCorreo,
	#superclass : #Object,
	#instVars : [
		'inbox',
		'carpetas'
	],
	#category : #'Objetos1-ClienteCorreo'
}

{ #category : #'instance creation' }
ClienteDeCorreo class >> newConInbox: unInbox carpetas: unasCarpetas [
	^ self new
		initializeConInbox: unInbox carpetas: unasCarpetas;
		yourself
]

{ #category : #queries }
ClienteDeCorreo >> buscar: texto [
	carpetas
		do: [ :carpeta | 
			| email |
			email := carpeta buscar: texto.
			email ifNotNil: [ ^ email ] ] .
		^nil 
]

{ #category : #initialization }
ClienteDeCorreo >> carpetas [
	^carpetas
]

{ #category : #queries }
ClienteDeCorreo >> espacioOcupado [
	^carpetas sumNumbers: [ :carpeta | carpeta espacioOcupado ]
]

{ #category : #initialization }
ClienteDeCorreo >> inbox [
	^inbox
]

{ #category : #initialization }
ClienteDeCorreo >> initialize [ 	
	carpetas := OrderedCollection new.
	inbox:= Carpeta new.
]

{ #category : #initialization }
ClienteDeCorreo >> initializeConInbox: unInbox carpetas: unasCarpetas [
	inbox:= unInbox .
	carpetas := unasCarpetas .
]

{ #category : #operations }
ClienteDeCorreo >> mover: email de: origen a: destino [
	origen eliminarEmail: email.
	destino almacenarEmail: email.
	
]

{ #category : #operations }
ClienteDeCorreo >> recibir: email [ 	
	inbox almacenarEmail: email.
]
