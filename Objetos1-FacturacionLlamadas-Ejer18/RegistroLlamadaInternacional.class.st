Class {
	#name : #RegistroLlamadaInternacional,
	#superclass : #RegistroLlamada,
	#instVars : [
		'paisOrigen',
		'paisDestino'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
RegistroLlamadaInternacional class >> newConFecha: fecha hora: hora duracion: duracion telefonoLlama: telefonoQueLlama telefonoRecibe: telefonoQueRecibe paisOri: paisOrigen paisDest: paisDestino [
	^ (self
		newConFecha: fecha
		hora: hora
		duracion: duracion
		telefonoLlama: telefonoQueLlama
		telefonoRecibe: telefonoQueRecibe)
		initializeConPaisOri: paisOrigen paisDest: paisDestino;
		yourself
]

{ #category : #operations }
RegistroLlamadaInternacional >> calcularCosto [
	^ duracionMin
		*
			(self esDiurna
				ifTrue: [ 3 ]
				ifFalse: [ 4 ])
]

{ #category : #private }
RegistroLlamadaInternacional >> esDiurna [
	| veinte ocho |
	veinte := Time hour: 20 minute: 0 second: 0.
	ocho := Time hour: 8 minute: 0 second: 0.
	^ hora between: ocho and: veinte
]

{ #category : #initialization }
RegistroLlamadaInternacional >> initializeConPaisOri: unPaisOrigen paisDest: unPaisDestino [
 	paisOrigen := unPaisOrigen .
	paisDestino := unPaisDestino .
]
