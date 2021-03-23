Class {
	#name : #PoliticaCancelacion,
	#superclass : #Object,
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #operations }
PoliticaCancelacion >> calcularMontoReembolso: unaReserva conFechaCancelacion: fechaTentativaCancelacion [ 
	self subclassResponsibility 
]

{ #category : #queries }
PoliticaCancelacion >> fechaCancelacionValida: fechaTentativaCancelacion fechaInicioPeriodo: fechaInicioPeriodo [
	^fechaTentativaCancelacion < fechaInicioPeriodo 
]
