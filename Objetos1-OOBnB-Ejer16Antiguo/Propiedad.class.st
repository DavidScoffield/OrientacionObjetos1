Class {
	#name : #Propiedad,
	#superclass : #Object,
	#instVars : [
		'propietario',
		'nombre',
		'descripcion',
		'precioPorNoche',
		'direccion',
		'fechasOcupadas'
	],
	#category : #'Objetos1-OOBnB-Ejer16Antiguo'
}

{ #category : #'instance creation' }
Propiedad class >> newConNombre: unNombre descripcion: unaDescripcion precioPorNoche: unPrecioPorNoche direccion: unaDireccion propietario: unPropietario [
	^ self new
		initializeConNombre: unNombre
			descripcion: unaDescripcion
			precioPorNoche: unPrecioPorNoche
			direccion: unaDireccion
			propietario: unPropietario;
		yourself
]

{ #category : #queries }
Propiedad >> estaDisponible: unPeriodo [
	fechasOcupadas
		detect: [ :periodo | periodo overlaps: unPeriodo ]
		ifFound: [ ^ false ]
		ifNone: [ ^ true ]
]

{ #category : #initialization }
Propiedad >> initializeConNombre: unNombre descripcion: unaDescripcion precioPorNoche: unPrecioPorNoche direccion: unaDireccion propietario: unPropietario [
	nombre := unNombre.
	descripcion := unaDescripcion.
	precioPorNoche := unPrecioPorNoche.
	direccion := unaDireccion.
	propietario := unPropietario.
	fechasOcupadas := OrderedCollection new.
	propietario agregarPropiedadPropia: self
]

{ #category : #operations }
Propiedad >> liberarPeriodo: unPeriodo [ 
	fechasOcupadas remove: unPeriodo 
]

{ #category : #accessing }
Propiedad >> precioPorNoche [
	^precioPorNoche 
]

{ #category : #accessing }
Propiedad >> propietario [
	^propietario 
]

{ #category : #operations }
Propiedad >> reservar: unPeriodo [ 
	fechasOcupadas add: unPeriodo 
]
