Class {
	#name : #OOBnBC,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'propiedades',
		'reservas'
	],
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #operations }
OOBnBC >> buscarPropiedadesDisponibles: unPeriodo [
	"^ propiedades
		select: [ :propiedad | propiedad estaDisponible: unPeriodo ]"

	propiedades
		reject: [ :propiedad | 
			reservas
				do: [ :reserva | 
					^ reserva propiedad = propiedad
						and: [ reserva periodo overlaps: unPeriodo ] ] ]
]

{ #category : #operations }
OOBnBC >> calcularIngresosPropietario: unUsuario fecha1: fecha1 fecha2: fecha2 [
	| lapse propiedadesUsuario reservasDePropiedadDeUsuario |
	lapse := DateLapse date1: fecha1 date2: fecha2.
	
	"propiedadesUsuario := self propiedadesQueTieneEnAlquiler: unUsuario" .
	
	"reservasDePropiedadDeUsuario := reservas
		select: [ :reserva | 
			(reserva periodo overlaps: lapse)
				and: [ propiedadesUsuario includes: reserva propiedad ] ]."
			
	reservasDePropiedadDeUsuario := reservas
		select: [ :reserva | 
			(reserva periodo overlaps: lapse)
				and: [ reserva propiedad propietario = unUsuario ] ].
			
	^reservasDePropiedadDeUsuario
		sumNumbers: [ :reserva | reserva calcularPrecioReservaPara: lapse  ]
]

{ #category : #operations }
OOBnBC >> eliminarReserva: unaReserva [
	unaReserva caduco
		ifFalse: [ ^ self ].
	reservas remove: unaReserva
]

{ #category : #initialization }
OOBnBC >> initialize [ 
	usuarios := OrderedCollection new.
	propiedades  := OrderedCollection new.
	reservas  := OrderedCollection new.
]

{ #category : #operations }
OOBnBC >> obtenerReservasUsuario: unUsuario [
	^reservas select: [ :reserva | reserva inquilino = unUsuario  ]
]

{ #category : #private }
OOBnBC >> propiedad: propiedad disponibleEn: unPeriodo [
	reservas
		detect: [ :reserva | 
			reserva propiedad = propiedad
				and: [ reserva periodo overlaps: unPeriodo ] ]
		ifFound: [ ^ false ]
		ifNone: [ ^ true ]
]

{ #category : #private }
OOBnBC >> propiedadesQueTieneEnAlquiler: unUsuario [ 
	^propiedades select: [ :propiedad | propiedad propietario = unUsuario ]
]

{ #category : #operations }
OOBnBC >> registrarPropiedadAlquilerConNombre: nombre descripcion: descripcion precioPorNoche: precioPorNoche direccion: direccion propietario: unUsuario [
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
OOBnBC >> registrarReservaPara: propiedad periodo: periodo inquilino: unUsuario [
	"| reserva |
	(propiedad estaDisponible: periodo)
		ifTrue: [ reserva := Reserva
				newConPropiedad: propiedad
				periodo: periodo
				usuario: unUsuario.
			reservas add: reserva ]"
		
	| reserva |
	(self propiedad: propiedad disponibleEn: periodo)
		ifTrue: [ reserva := Reserva
				newConPropiedad: propiedad
				periodo: periodo
				usuario: unUsuario.
			reservas add: reserva ]
]

{ #category : #operations }
OOBnBC >> registrarUsuarioConNombre: nombre direccion: direccion dni: dni [
	| usuario |
	usuario := UsuarioProp
		newConNombre: nombre
		direccion: direccion
		dni: dni.
	usuarios add: usuario
]
