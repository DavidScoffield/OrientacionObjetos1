Class {
	#name : #ClienteDeCorreoTest,
	#superclass : #TestCase,
	#category : #'Objetos1-ClienteCorreoTest'
}

{ #category : #running }
ClienteDeCorreoTest >> setUp [
	archivo1 := Archivo conNombre: 'Nombre archivo1'.
	archivo2 := Archivo conNombre: 'Nombre archivo2 con mas texto'.
	archivo3 := Archivo conNombre: 'Nombre archivo3'.
	archivo4 := Archivo conNombre: 'Nombre archivo4 con texto'.
	archivo5 := Archivo conNombre: 'archivo5'.
	archivo6 := Archivo conNombre: 'Nombre archivo6'.
	archivo7 := Archivo conNombre: 'Nombre archivo7'.
	archivo8 := Archivo conNombre: 'Nombre archivo8'.
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
ClienteDeCorreoTest >> testBuscar [
	| carpeta email email2 inbox carpetas correo |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2 := Email conTitulo: 'A' cuerpo: 'B'.
	carpeta := Carpeta new.
	carpeta almacenarEmail: email.
	carpeta almacenarEmail: email2.
	inbox:= Carpeta conNombre: 'Inbox'.
	
	carpetas:= OrderedCollection new.
	carpetas add: carpeta ;
	add: inbox.
	
	correo:=ClienteDeCorreo newConInbox: inbox carpetas: carpetas.
	self assert: (correo buscar: 'B') equals: email2.
	self assert: (correo buscar: 'Un titulo') equals: email.
	self assert: (correo buscar: 'AS') equals: nil
]

{ #category : #tests }
ClienteDeCorreoTest >> testCarpetas [
	|correo carpetas |
	carpetas := OrderedCollection new.
	correo:= (ClienteDeCorreo newConInbox: (Carpeta conNombre: 'Inbox') carpetas: carpetas).
	
	self assert:  correo carpetas equals: carpetas .
]

{ #category : #tests }
ClienteDeCorreoTest >> testEspacioOcupado [
	| correo carpeta emails email email2 inbox carpetas |
	email := Email conTitulo: 'Un titulo' cuerpo: 'Un cuerpo'.
	email2 := Email conTitulo: 'A' cuerpo: 'B'.
	emails := OrderedCollection new.
	emails
		add: email;
		add: email2.
	carpeta := Carpeta conNombre: 'Nombrede la carpeta' emails: emails.
	
	inbox:=Carpeta conNombre: 'Nombre'.
	carpetas:= OrderedCollection new.
	carpetas add: inbox; add: carpeta.
	correo := ClienteDeCorreo newConInbox: inbox carpetas: carpetas. 
	self assert: correo espacioOcupado equals: 20
]

{ #category : #tests }
ClienteDeCorreoTest >> testInbox [
	|correo inbox |
	inbox:= Carpeta conNombre: 'Inbox'.
	correo:= (ClienteDeCorreo newConInbox: inbox carpetas: (OrderedCollection new)).
	
	self assert:  correo inbox equals: inbox
]

{ #category : #tests }
ClienteDeCorreoTest >> testInitialize [ 
	|correo |
	correo:= ClienteDeCorreo new.
	self assert: correo carpetas isEmpty .
	self assert: correo inbox emails isEmpty 
]

{ #category : #tests }
ClienteDeCorreoTest >> testInitializeConInboxCarpetas [
	| correo inbox carpetas |
	inbox := Carpeta conNombre: 'Carpeta inbox'.
	carpetas := OrderedCollection new.
	carpetas add: (Carpeta conNombre: 'a').
	carpetas add:(Carpeta conNombre: 'b').
	carpetas add: (Carpeta conNombre: 'c').
	correo := ClienteDeCorreo newConInbox: inbox carpetas: carpetas.
	self assert: correo inbox equals: inbox.
	self assert: correo carpetas equals: carpetas
]

{ #category : #tests }
ClienteDeCorreoTest >> testMoverDeA [
	| correo inbox carpetas email1 emails carpeta1 carpeta2 |
	inbox := Carpeta conNombre: 'Carpeta inbox'.
	carpetas := OrderedCollection new.
	emails := OrderedCollection new.
	email1 := Email conTitulo: 'Email1' cuerpo: 'Cuerpo email1'.
	emails add: email1.
	emails add: (Email conTitulo: 'Email1' cuerpo: 'Cuerpo email1').
	carpeta1 := Carpeta conNombre: 'a' emails: emails.
	carpeta2 := Carpeta conNombre: 'b'.
	carpetas add: carpeta1.
	carpetas add: carpeta2.
	carpetas add: (Carpeta conNombre: 'c').
	correo := ClienteDeCorreo newConInbox: inbox carpetas: carpetas.
	self assert: (carpeta1 emails includes: email1).
	self deny: (carpeta2 emails includes: email1).
	correo mover: email1 de: carpeta1 a: carpeta2.
	self deny: (carpeta1 emails includes: email1).
	self assert: (carpeta2 emails includes: email1)
]

{ #category : #tests }
ClienteDeCorreoTest >> testRecibir [
	| correo email |
	correo := ClienteDeCorreo new.
	self assert: correo inbox emails isEmpty.
	email := Email conTitulo: 'Email' cuerpo: 'Cuerpo'.
	correo recibir: email.
	self deny: correo inbox emails isEmpty.
	self assert: (correo inbox emails includes: email)
]
