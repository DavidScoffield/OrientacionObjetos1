Class {
	#name : #Reserva,
	#superclass : #Object,
	#instVars : [
		'periodo',
		'inquilino',
		'propiedad'
	],
	#category : #'Objetos1-OOBnB-Ejer16Antiguo'
}

{ #category : #'instance creation' }
Reserva class >> newConPropiedad: unaPropiedad periodo: unPeriodo usuario: unUsuario [
	^ self new
		initializeConPropiedad: unaPropiedad
			periodo: unPeriodo
			usuario: unUsuario;
		yourself.
]

{ #category : #queries }
Reserva >> caduco [ 
	^periodo from > Date today
]

{ #category : #queries }
Reserva >> calcularPrecioReserva [
	^ periodo sizeInDays * propiedad precioPorNoche
]

{ #category : #operations }
Reserva >> calcularPrecioReservaPara: lapse [ 
	| cantDias | 
	cantDias:= periodo numberOfOverlappingDays: lapse.

	^ cantDias * propiedad precioPorNoche
]

{ #category : #initialization }
Reserva >> initializeConPropiedad: unaPropiedad periodo: unPeriodo usuario: unUsuario [ 
	inquilino := unUsuario .
	periodo := unPeriodo .
	propiedad := unaPropiedad .
	unaPropiedad reservar: unPeriodo .
]

{ #category : #accessing }
Reserva >> inquilino [ 
	^inquilino 
]

{ #category : #operations }
Reserva >> liberarPropiedad [
	propiedad liberarPeriodo: periodo.
]

{ #category : #accessing }
Reserva >> periodo [
	^periodo 
]

{ #category : #accessing }
Reserva >> propiedad [
	^propiedad
]
