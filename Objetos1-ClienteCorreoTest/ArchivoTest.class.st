Class {
	#name : #ArchivoTest,
	#superclass : #TestCase,
	#category : #'Objetos1-ClienteCorreoTest'
}

{ #category : #running }
ArchivoTest >> testConstructor [
	| archivo |
	archivo := Archivo conNombre: 'Nombre del archivo'.
	self assert: archivo nombre equals: 'Nombre del archivo'.
]

{ #category : #running }
ArchivoTest >> testNombre [
	|archivo|
	archivo:=Archivo new.
	archivo nombre: 'Nombre del archivo'.
	self assert: archivo nombre equals: 'Nombre del archivo'.
]

{ #category : #running }
ArchivoTest >> testTamano [
	| archivo |
	archivo := Archivo conNombre: 'Nombre del archivo'.
	self assert: archivo tamano equals: 18
]
