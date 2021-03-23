Class {
	#name : #CarpetaTest,
	#superclass : #TestCase,
	#category : #'Objetos1-ClienteCorreoTest'
}

{ #category : #running }
CarpetaTest >> testAlmacenarEmail [
	| carpeta email email2 |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2:= Email conTitulo: 'A' cuerpo: 'B'.
	carpeta := Carpeta new.
	carpeta almacenarEmail: email.
	 
	self assert: (carpeta emails includes: email).
	self deny: (carpeta emails includes: email2).
]

{ #category : #running }
CarpetaTest >> testBuscar [
	| carpeta email email2 |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2 := Email conTitulo: 'A' cuerpo: 'B'.
	carpeta := Carpeta new.
	carpeta almacenarEmail: email.
	carpeta almacenarEmail: email2.
	self assert: (carpeta buscar: 'B') equals: email2.
	self assert: (carpeta buscar: 'Un titulo') equals: email.
	self assert: (carpeta buscar: 'AS') equals: nil
]

{ #category : #running }
CarpetaTest >> testEliminarEmail [
	| carpeta emails email email2 |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2 := Email conTitulo: 'A' cuerpo: 'B'.
	emails:=OrderedCollection new.
	emails add: email; add:email2.
	carpeta := Carpeta conNombre: 'Nombrede la carpeta' emails: emails .
	carpeta eliminarEmail: email2.
	
	self deny: (carpeta emails includes: email2)


]

{ #category : #running }
CarpetaTest >> testEmails [
	| carpeta emails email email2 |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2 := Email conTitulo: 'A' cuerpo: 'B'.
	emails:=OrderedCollection new.
	emails add: email; add:email2.
	carpeta := Carpeta conNombre: 'Nombrede la carpeta' emails: emails .
	
	self assert: carpeta emails equals: emails


]

{ #category : #running }
CarpetaTest >> testEspacioOcupado [ 
	| carpeta emails email email2 |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2 := Email conTitulo: 'A' cuerpo: 'B'.
	emails:=OrderedCollection new.
	emails add: email; add:email2.
	carpeta := Carpeta conNombre: 'Nombrede la carpeta' emails: emails .
	
	self assert: carpeta espacioOcupado equals: 20


]

{ #category : #running }
CarpetaTest >> testInitialize [ 
	|carpeta| 
	carpeta:=Carpeta new.
	self assert: carpeta emails isEmpty 

]

{ #category : #running }
CarpetaTest >> testInitializeConNombreEmails [
	|carpeta emails| 
	emails:=OrderedCollection new. 
	emails add: (Email conTitulo: 'A' cuerpo: 'V'). 
	emails add: (Email conTitulo: 'B' cuerpo: 'C').
	emails add: (Email conTitulo: 'N' cuerpo: 'E').
	carpeta:=Carpeta conNombre: 'Carpeta David' emails: emails.
	self assert: carpeta emails equals: emails.
	self assert: carpeta nombre equals: 'Carpeta David' 

]

{ #category : #running }
CarpetaTest >> testNombre [
	|carpeta| 
	carpeta := Carpeta new.
	carpeta nombre: 'Nuevo nombre'.
	self assert: carpeta nombre equals: 'Nuevo nombre'
]
