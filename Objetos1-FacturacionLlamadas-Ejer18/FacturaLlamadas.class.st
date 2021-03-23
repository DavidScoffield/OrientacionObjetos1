Class {
	#name : #FacturaLlamadas,
	#superclass : #Object,
	#instVars : [
		'cliente',
		'fechaFacturacion',
		'fechaInicioPeriodo',
		'fechaFinPeriodo',
		'montoTotal'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
FacturaLlamadas class >> newConCliente: unCliente fechaInicio: fechaInicio fechaFin: fechaFin montoTotal: montoTotal [ 
	^ self new
		initializeConCliente: unCliente
			fechaInicio: fechaInicio
			fechaFin: fechaFin
			montoTotal: montoTotal;
		yourself.
]

{ #category : #initialization }
FacturaLlamadas >> initializeConCliente: unCliente fechaInicio: fechaInicio fechaFin: fechaFin montoTotal: unMontoTotal [
	cliente := unCliente .
	fechaFacturacion := Date today.
	fechaInicioPeriodo := fechaInicio .
	fechaFinPeriodo := fechaFin .
	montoTotal := unMontoTotal .
]
