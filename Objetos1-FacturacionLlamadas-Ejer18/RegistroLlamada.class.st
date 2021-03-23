Class {
	#name : #RegistroLlamada,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'hora',
		'duracionMin',
		'telefonoQueLlama',
		'telefonoQueRecibe'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
RegistroLlamada class >> newConFecha: fecha hora: hora duracion: duracion telefonoLlama: telefonoQueLlama telefonoRecibe: telefonoQueRecibe [
	^ self new
		initializeConFecha: fecha
			hora: hora
			duracion: duracion
			telefonoLlama: telefonoQueLlama
			telefonoRecibe: telefonoQueRecibe;
		yourself
]

{ #category : #operations }
RegistroLlamada >> calcularCosto [
	self subclassResponsibility 
]

{ #category : #initialization }
RegistroLlamada >> initializeConFecha: unaFecha hora: unaHora duracion: unaDuracion telefonoLlama: unTelefonoQueLlama telefonoRecibe: unTelefonoQueRecibe [
	fecha := unaFecha.
	hora := unaHora.
	duracionMin := unaDuracion.
	telefonoQueLlama := unTelefonoQueLlama.
	telefonoQueRecibe := unTelefonoQueRecibe
]

{ #category : #accessing }
RegistroLlamada >> telefonoQueLlama [
	^telefonoQueLlama 
]
