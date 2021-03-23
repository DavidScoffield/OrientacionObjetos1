Class {
	#name : #ContratoDePlanta,
	#superclass : #Contrato,
	#instVars : [
		'sueldoMensual',
		'montoPorConyugue',
		'montoPorHijos'
	],
	#category : #'Objetos1-LiquidacionHaberes-Ejer19'
}

{ #category : #'instance creation' }
ContratoDePlanta class >> newConFechaInicio: unaFechaInicio sueldoMensual: unSueldoMensual montoPorConyugue: unMontoPorConyugue montoPorHijos: unMontoPorHijos [
	^ (self newConFechaInicio: unaFechaInicio)
		initializeConSueldoMensual: unSueldoMensual
			montoPorConyugue: unMontoPorConyugue
			montoPorHijos: unMontoPorHijos;
		yourself.
]

{ #category : #queries }
ContratoDePlanta >> estaVencido [
	^false
]

{ #category : #initialization }
ContratoDePlanta >> initializeConSueldoMensual: unSueldoMensual montoPorConyugue: unMontoPorConyugue montoPorHijos: unMontoPorHijos [ 
	sueldoMensual := unSueldoMensual .
	montoPorConyugue := unMontoPorConyugue .
	montoPorHijos := unMontoPorHijos .
	
]

{ #category : #queries }
ContratoDePlanta >> montoACobrarPara: empleado [ 
	| montoTotal |
	montoTotal := sueldoMensual.
	empleado tieneConyugue
		ifTrue: [ montoTotal := montoTotal + montoPorConyugue ].
	empleado tieneHijos
		ifTrue: [ montoTotal := montoTotal + montoPorHijos ].
	^ montoTotal
]
