Class {
	#name : #UsuarioPropC,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'direccion',
		'dni'
	],
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #'instance creation' }
UsuarioPropC class >> newConNombre: unNombre direccion: unaDireccion dni: unDni [
	^ self new
		initializeConNombre: unNombre direccion: unaDireccion dni: unDni;
		yourself
]

{ #category : #accessing }
UsuarioPropC >> direccion [  	
	^direccion
]

{ #category : #accessing }
UsuarioPropC >> direccion: unaDireccion [  	
	direccion := unaDireccion 
]

{ #category : #accessing }
UsuarioPropC >> dni [
	^dni
]

{ #category : #accessing }
UsuarioPropC >> dni: unDni [
	dni:= unDni
]

{ #category : #initialization }
UsuarioPropC >> initializeConNombre: unNombre direccion: unaDireccion dni: unDni [
	nombre:= unNombre .
	direccion := unaDireccion.
	dni := unDni .

]

{ #category : #accessing }
UsuarioPropC >> nombre [ 	
	^nombre
]

{ #category : #accessing }
UsuarioPropC >> nombre: unNombre [  	
	nombre:= unNombre
]
