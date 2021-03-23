Class {
	#name : #Email,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'cuerpo',
		'adjuntos'
	],
	#category : #'Objetos1-ClienteCorreo'
}

{ #category : #'instance creation' }
Email class >> conTitulo: unTitulo cuerpo: unCuerpo [
	^ self new initializeConTitulos: unTitulo  cuerpo: unCuerpo; 
		yourself
]

{ #category : #'instance creation' }
Email class >> conTitulo: unTitulo cuerpo: unCuerpo adjuntos: unosAdjuntos [
	^ self new initializeConTitulos: unTitulo  cuerpo: unCuerpo  adjuntos: unosAdjuntos ; 
		yourself
]

{ #category : #accessing }
Email >> adjuntos [
	^adjuntos
]

{ #category : #queries }
Email >> contiene: texto [
	^(titulo includesSubstring: texto) or: [cuerpo includesSubstring: texto]
]

{ #category : #accessing }
Email >> cuerpo [
	^cuerpo
]

{ #category : #accessing }
Email >> cuerpo: unCuerpo [
	cuerpo := unCuerpo
]

{ #category : #queries }
Email >> espacioOcupado [
 	|tamanoArchivos |
	tamanoArchivos := adjuntos sumNumbers: [ :archivo | archivo tamano ].
	^ tamanoArchivos + titulo size + cuerpo size 
]

{ #category : #initialization }
Email >> initialize [ 
	adjuntos := OrderedCollection new.
]

{ #category : #initialization }
Email >> initializeConTitulos: unTitulo  cuerpo: unCuerpo [
 
	titulo := unTitulo.
	cuerpo := unCuerpo.

]

{ #category : #initialization }
Email >> initializeConTitulos: unTitulo  cuerpo: unCuerpo adjuntos: unosAdjuntos [
 
	titulo := unTitulo.
	cuerpo := unCuerpo.
	adjuntos := unosAdjuntos.
]

{ #category : #accessing }
Email >> titulo [
	^titulo
]

{ #category : #accessing }
Email >> titulo: unTitulo [
	titulo:= unTitulo 
]
