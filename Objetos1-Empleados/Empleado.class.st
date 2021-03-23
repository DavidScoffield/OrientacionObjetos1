Class {
	#name : #Empleado,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'Objetos1-Empleados'
}

{ #category : #'as yet unclassified' }
Empleado >> aportes [
	^10
]

{ #category : #'as yet unclassified' }
Empleado >> montoBasico [
	^ 700
]

{ #category : #'as yet unclassified' }
Empleado >> sueldoBasico [
	^ self montoBasico - self aportes
]
