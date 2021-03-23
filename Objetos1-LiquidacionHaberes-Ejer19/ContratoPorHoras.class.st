Class {
	#name : #ContratoPorHoras,
	#superclass : #Contrato,
	#instVars : [
		'valorHora',
		'nroHoras',
		'fechaFin'
	],
	#category : #'Objetos1-LiquidacionHaberes-Ejer19'
}

{ #category : #'instance creation' }
ContratoPorHoras class >> newConFechaInicio: unaFechaInicio fechaFin: unaFechaFin nroHoras: unNroHoras valorHora: unValorHora [
	^ (self newConFechaInicio: unaFechaInicio)
		initializeConFechaFin: unaFechaFin
			nroHoras: unNroHoras
			valorHora: unValorHora;
		yourself
]

{ #category : #queries }
ContratoPorHoras >> estaVencido [
	^ fechaFin = Date today
]

{ #category : #initialization }
ContratoPorHoras >> initializeConFechaFin: unaFechaFin nroHoras: unNroHoras valorHora: unValorHora [
	fechaFin := unaFechaFin.
	nroHoras := unNroHoras.
	valorHora := unValorHora
]

{ #category : #queries }
ContratoPorHoras >> montoACobrarPara: empleado [ 
	^valorHora * nroHoras 
]
