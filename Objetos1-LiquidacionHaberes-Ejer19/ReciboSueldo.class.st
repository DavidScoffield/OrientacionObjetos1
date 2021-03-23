Class {
	#name : #ReciboSueldo,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'cuil',
		'antiguedad',
		'montoTotal',
		'fechaDeGeneracion'
	],
	#category : #'Objetos1-LiquidacionHaberes-Ejer19'
}

{ #category : #'instance creation' }
ReciboSueldo class >> newConNombre: nombre apellido: apellido cuil: cuil antiguedad: antiguedad montoTotal: montoTotal [
	^ self new
		initializeConNombre: nombre
			apellido: apellido
			cuil: cuil
			antiguedad: antiguedad
			montoTotal: montoTotal;
		yourself
]

{ #category : #initialization }
ReciboSueldo >> initializeConNombre: unNombre apellido: unApellido cuil: unCuil antiguedad: unaAntiguedad montoTotal: unMontoTotal [
	nombre := unNombre.
	apellido := unApellido.
	cuil := unCuil.
	antiguedad := unaAntiguedad.
	montoTotal := unMontoTotal.
	fechaDeGeneracion := Date today.
]
