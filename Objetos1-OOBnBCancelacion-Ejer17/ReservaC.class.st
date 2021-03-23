Class {
	#name : #ReservaC,
	#superclass : #Object,
	#instVars : [
		'periodo',
		'inquilino',
		'propiedad'
	],
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #'instance creation' }
ReservaC class >> newConPropiedad: unaPropiedad periodo: unPeriodo usuario: unUsuario [
	^ self new
		initializeConPropiedad: unaPropiedad
			periodo: unPeriodo
			usuario: unUsuario;
		yourself.
]

{ #category : #queries }
ReservaC >> caduco [ 
	^periodo from > Date today
]

{ #category : #operations }
ReservaC >> calcularMontoReembolso: fechaTentativaCancelacion [  
 	^ propiedad calcularMontoReembolso: self conFechaCancelacion: fechaTentativaCancelacion 
]

{ #category : #queries }
ReservaC >> calcularPrecioReserva [
	^ periodo sizeInDays * propiedad precioPorNoche
]

{ #category : #operations }
ReservaC >> calcularPrecioReservaPara: lapse [ 
	| cantDias | 
	cantDias:= periodo numberOfOverlappingDays: lapse.

	^ cantDias * propiedad precioPorNoche
]

{ #category : #initialization }
ReservaC >> initializeConPropiedad: unaPropiedad periodo: unPeriodo usuario: unUsuario [ 
	inquilino := unUsuario .
	periodo := unPeriodo .
	propiedad := unaPropiedad .
]

{ #category : #accessing }
ReservaC >> inquilino [ 
	^inquilino 
]

{ #category : #accessing }
ReservaC >> periodo [
	^periodo 
]

{ #category : #accessing }
ReservaC >> propiedad [
	^propiedad
]
