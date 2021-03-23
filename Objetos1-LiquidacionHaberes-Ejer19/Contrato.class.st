Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'fechaInicio'
	],
	#category : #'Objetos1-LiquidacionHaberes-Ejer19'
}

{ #category : #'instance creation' }
Contrato class >> newConFechaInicio: fechaInicio [
	^ self new
		initializeConFechaInicio: fechaInicio;
		yourself
]

{ #category : #queries }
Contrato >> estaVencido [
	self subclassResponsibility 
]

{ #category : #initialization }
Contrato >> initializeConFechaInicio: unaFechaInicio [
	fechaInicio := unaFechaInicio
]

{ #category : #queries }
Contrato >> montoACobrarPara: empleado [ 
	self subclassResponsibility 
]
