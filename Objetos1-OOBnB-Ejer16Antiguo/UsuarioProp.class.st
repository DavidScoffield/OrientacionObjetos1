Class {
	#name : #UsuarioProp,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'direccion',
		'dni',
		'reservas',
		'propiedadesAlquiladas',
		'propiedadesQueTieneEnAlquiler'
	],
	#category : #'Objetos1-OOBnB-Ejer16Antiguo'
}

{ #category : #'instance creation' }
UsuarioProp class >> newConNombre: unNombre direccion: unaDireccion dni: unDni [
	^ self new
		initializeConNombre: unNombre direccion: unaDireccion dni: unDni;
		yourself
]

{ #category : #operations }
UsuarioProp >> agregarPropiedadPropia: unaPropiedad [
	propiedadesQueTieneEnAlquiler add: unaPropiedad 
]

{ #category : #operations }
UsuarioProp >> agregarReserva: unaReserva [
	reservas add: unaReserva  
]

{ #category : #accessing }
UsuarioProp >> direccion [  	
	^direccion
]

{ #category : #accessing }
UsuarioProp >> direccion: unaDireccion [  	
	direccion := unaDireccion 
]

{ #category : #accessing }
UsuarioProp >> dni [
	^dni
]

{ #category : #accessing }
UsuarioProp >> dni: unDni [
	dni:= unDni
]

{ #category : #initialization }
UsuarioProp >> initializeConNombre: unNombre direccion: unaDireccion dni: unDni [
	nombre:= unNombre .
	direccion := unaDireccion.
	dni := unDni .
	propiedadesQueTieneEnAlquiler := OrderedCollection new.
	propiedadesAlquiladas := OrderedCollection new.
	reservas := OrderedCollection new.
]

{ #category : #accessing }
UsuarioProp >> nombre [ 	
	^nombre
]

{ #category : #accessing }
UsuarioProp >> nombre: unNombre [  	
	nombre:= unNombre
]

{ #category : #accessing }
UsuarioProp >> propiedadesAlquiladas [
	^propiedadesAlquiladas 
]

{ #category : #accessing }
UsuarioProp >> propiedadesQueTieneEnAlquiler [
	^propiedadesQueTieneEnAlquiler 
]

{ #category : #accessing }
UsuarioProp >> reservas [
	^reservas 
]
