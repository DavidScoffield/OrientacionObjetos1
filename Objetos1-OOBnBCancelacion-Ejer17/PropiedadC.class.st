Class {
	#name : #PropiedadC,
	#superclass : #Object,
	#instVars : [
		'propietario',
		'nombre',
		'descripcion',
		'precioPorNoche',
		'direccion',
		'politicaCancelacion'
	],
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #'instance creation' }
PropiedadC class >> newConNombre: unNombre descripcion: unaDescripcion precioPorNoche: unPrecioPorNoche direccion: unaDireccion propietario: unPropietario [
	^ self new
		initializeConNombre: unNombre
			descripcion: unaDescripcion
			precioPorNoche: unPrecioPorNoche
			direccion: unaDireccion
			propietario: unPropietario;
		yourself
]

{ #category : #operations }
PropiedadC >> calcularMontoReembolso: unaReserva conFechaCancelacion: fechaTentativaCancelacion [ 
	^politicaCancelacion calcularMontoReembolso: unaReserva conFechaCancelacion: fechaTentativaCancelacion 
]

{ #category : #initialization }
PropiedadC >> initializeConNombre: unNombre descripcion: unaDescripcion precioPorNoche: unPrecioPorNoche direccion: unaDireccion propietario: unPropietario [
	nombre := unNombre.
	descripcion := unaDescripcion.
	precioPorNoche := unPrecioPorNoche.
	direccion := unaDireccion.
	propietario := unPropietario.
]

{ #category : #accessing }
PropiedadC >> precioPorNoche [
	^precioPorNoche 
]

{ #category : #accessing }
PropiedadC >> propietario [
	^propietario 
]
