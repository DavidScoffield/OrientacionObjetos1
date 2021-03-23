Class {
	#name : #PoliticaCancelacionFlexible,
	#superclass : #PoliticaCancelacion,
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #operations }
PoliticaCancelacionFlexible >> calcularMontoReembolso: unaReserva conFechaCancelacion: fechaTentativaCancelacion [
	(self
		fechaCancelacionValida: fechaTentativaCancelacion
		fechaInicioPeriodo: unaReserva periodo from)
		ifTrue: [ ^ unaReserva calcularPrecioReserva ].
	^ 0
]
