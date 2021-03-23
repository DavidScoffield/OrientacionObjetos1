Class {
	#name : #EmailTest,
	#superclass : #TestCase,
	#instVars : [
		'archivo1',
		'archivo2',
		'archivo3',
		'archivo4',
		'archivo5',
		'archivo6',
		'archivo7',
		'archivo8',
		'adjuntos1',
		'email1'
	],
	#category : #'Objetos1-ClienteCorreoTest'
}

{ #category : #running }
EmailTest >> setUp [
	archivo1 := Archivo conNombre: 'Nombre archivo1'.
	archivo2 := Archivo conNombre: 'Nombre archivo2 con mas texto'.
	
	adjuntos1 := OrderedCollection new.
	adjuntos1
		add: archivo1;
		add: archivo2.
		
	email1 := Email
		conTitulo: 'Nombre del email1'
		cuerpo: 'Este es el cuerpo del email 1'
		adjuntos: adjuntos1.
]

{ #category : #tests }
EmailTest >> testAdjuntos [
	self assert: email1 adjuntos = adjuntos1 
]

{ #category : #tests }
EmailTest >> testContiene [
	self assert: (email1 contiene: 'es el cuerpo').
	self assert: (email1 contiene: 'Nombre del').
	self deny: (email1 contiene: 'nnombre')
]

{ #category : #tests }
EmailTest >> testCuerpo [
	email1 cuerpo: 'Cambio de cuerpo'.
	self assert: email1 cuerpo equals:'Cambio de cuerpo'
]

{ #category : #tests }
EmailTest >> testEspacioOcupado [
	self assert: email1 espacioOcupado equals: 90
]

{ #category : #tests }
EmailTest >> testInitialize [ 
	|email|
	email:=Email new.
	self assert: email adjuntos size equals:0
	
]

{ #category : #tests }
EmailTest >> testInitializeConTituloCuerpo [
	|email|
	
	email:=Email conTitulo: 'Titulo' cuerpo: 'Cuerpo'.
	self assert: email titulo equals: 'Titulo' .
	self assert: email cuerpo equals: 'Cuerpo' .
]

{ #category : #tests }
EmailTest >> testInitializeConTituloCuerpoAdjuntos [
	| email archivo adjuntos |
	archivo := Archivo conNombre: 'Nombre archivo'.
	adjuntos := OrderedCollection new.
	adjuntos add: archivo.
	email := Email
		conTitulo: 'Titulo'
		cuerpo: 'Cuerpo'
		adjuntos: adjuntos.
	self assert: email titulo equals: 'Titulo'.
	self assert: email cuerpo equals: 'Cuerpo'.
	self assert: email adjuntos equals: adjuntos
]

{ #category : #tests }
EmailTest >> testTitulo [
	| email |
	email := Email new.
	email titulo: 'Titulo email'.
	self assert: email titulo equals: 'Titulo email'
]
