Class {
	#name : #OOBnB,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'propiedades',
		'reservas'
	],
	#category : #'Objetos1-OOBnB-Ejer16Antiguo'
}

{ #category : #operations }
OOBnB >> buscarPropiedadesDisponibles: unPeriodo [
	^ propiedades
		select: [ :propiedad | propiedad estaDisponible: unPeriodo ]
]

{ #category : #operations }
OOBnB >> calcularIngresosPropietario: unUsuario fecha1: fecha1 fecha2: fecha2 [
	| lapse propiedadesUsuario reservasDePropiedadDeUsuario |
	lapse := DateLapse date1: fecha1 date2: fecha2.
	
	propiedadesUsuario := unUsuario propiedadesQueTieneEnAlquiler.
	
	reservasDePropiedadDeUsuario := reservas
		select: [ :reserva | 
			(reserva periodo overlaps: lapse)
				and: [ propiedadesUsuario includes: reserva propiedad ] ].
			
	^reservasDePropiedadDeUsuario
		sumNumbers: [ :reserva | reserva calcularPrecioReserva ]
]

{ #category : #operations }
OOBnB >> eliminarReserva: unaReserva [
	unaReserva caduco
		ifFalse: [ ^ self ].
	unaReserva liberarPropiedad.
	reservas remove: unaReserva
]

{ #category : #initialization }
OOBnB >> initialize [ 
	usuarios := OrderedCollection new.
	propiedades  := OrderedCollection new.
	reservas  := OrderedCollection new.
]

{ #category : #operations }
OOBnB >> obtenerReservasUsuario: unUsuario [
	^unUsuario reservas.
]

{ #category : #private }
OOBnB >> propiedad: propiedad disponibleEn: unPeriodo [
	reservas
		detect: [ :reserva | 
			reserva propiedad = propiedad
				and: [ reserva periodo overlaps: unPeriodo ] ]
		ifFound: [ ^ false ]
		ifNone: [ ^ true ]
]

{ #category : #private }
OOBnB >> propiedadesQueTieneEnAlquiler: unUsuario [ 
	^propiedades select: [ :propiedad | propiedad propietario = unUsuario ]
]

{ #category : #operations }
OOBnB >> registrarPropiedadAlquilerConNombre: nombre descripcion: descripcion precioPorNoche: precioPorNoche direccion: direccion propietario: unUsuario [
	| propiedad |
	propiedad := Propiedad
		newConNombre: nombre
		descripcion: descripcion
		precioPorNoche: precioPorNoche
		direccion: direccion
		propietario: unUsuario.
	propiedades add: propiedad
]

{ #category : #operations }
OOBnB >> registrarReservaPara: propiedad periodo: periodo inquilino: unUsuario [
	| reserva |
	(propiedad estaDisponible: periodo)
		ifTrue: [ reserva := Reserva
				newConPropiedad: propiedad
				periodo: periodo
				usuario: unUsuario.
			reservas add: reserva.
			unUsuario agregarReserva: reserva ]
]

{ #category : #operations }
OOBnB >> registrarUsuarioConNombre: nombre direccion: direccion dni: dni [
	| usuario |
	usuario := UsuarioProp
		newConNombre: nombre
		direccion: direccion
		dni: dni.
	usuarios add: usuario
]
