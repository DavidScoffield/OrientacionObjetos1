Class {
	#name : #Archivo,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'Objetos1-ClienteCorreo'
}

{ #category : #'instance creation' }
Archivo class >> conNombre: unNombre [
	^ self new
		nombre: unNombre;
		yourself
]

{ #category : #accessing }
Archivo >> nombre [ 	
	^nombre
]

{ #category : #accessing }
Archivo >> nombre: unNombre [
	nombre := unNombre
]

{ #category : #accessing }
Archivo >> tamano [
	^nombre size  
]
