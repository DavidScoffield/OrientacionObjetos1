Class {
	#name : #Carpeta,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'emails'
	],
	#category : #'Objetos1-ClienteCorreo'
}

{ #category : #'instance creation' }
Carpeta class >> conNombre: unNombre [
	^ self new
		nombre: unNombre;
		yourself
]

{ #category : #'instance creation' }
Carpeta class >> conNombre: unNombre emails: unosEmails [
	^ self new
		initializeConNombre: unNombre emails: unosEmails;
		yourself
]

{ #category : #operations }
Carpeta >> almacenarEmail: email [
	emails add: email 
]

{ #category : #queries }
Carpeta >> buscar: texto [ 
	^emails detect: [ :email | email contiene: texto ] ifNone: [ ^nil ]
]

{ #category : #operations }
Carpeta >> eliminarEmail: email [ 
	emails remove: email.
]

{ #category : #operations }
Carpeta >> emails [
	^emails
]

{ #category : #queries }
Carpeta >> espacioOcupado [
	^emails sumNumbers: [ :email | email espacioOcupado ]
]

{ #category : #initialization }
Carpeta >> initialize [ 
	emails:= OrderedCollection new.
]

{ #category : #initialization }
Carpeta >> initializeConNombre: unNombre emails: unosEmails [
	nombre := unNombre.
	emails := unosEmails
]

{ #category : #accessing }
Carpeta >> nombre [ 
	^nombre
]

{ #category : #accessing }
Carpeta >> nombre: unNombre [ 
	nombre := unNombre 
]
