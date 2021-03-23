Class {
	#name : #PoliticaCancelacionModerada,
	#superclass : #PoliticaCancelacion,
	#category : #'Objetos1-OOBnBCancelacion-Ejer17'
}

{ #category : #operations }
PoliticaCancelacionModerada >> calcularMontoReembolso: unaReserva conFechaCancelacion: fechaTentativaCancelacion [
	| fechaInicio |
	fechaInicio := unaReserva periodo from.
		
	(self
		fechaCancelacionValida: fechaTentativaCancelacion
		fechaInicioPeriodo: fechaInicio)
		ifFalse: [ ^ 0 ].
	(self
		esDeHaceUnaSemana: fechaTentativaCancelacion
		fechaInicio: fechaInicio)
		ifTrue: [ ^ unaReserva calcularPrecioReserva ].
	(self
		esDeHaceDosDias: fechaTentativaCancelacion
		fechaInicio: fechaInicio)
		ifTrue: [ ^ unaReserva calcularPrecioReserva * 0.5 ].
	^ 0
	
	
	
	"(self
		fechaCancelacionValida: fechaTentativaCancelacion
		fechaInicioPeriodo: fechaInicio)
		ifTrue: [ (self
				esDeHaceUnaSemana: fechaTentativaCancelacion
				fechaInicio: fechaInicio)
				ifTrue: [ ^ unaReserva calcularPrecioReserva ]
				ifFalse: [ (self
						esDeHaceDosDias: fechaTentativaCancelacion
						fechaInicio: fechaInicio)
						ifTrue: [ ^ unaReserva calcularPrecioReserva * 0.5 ]
						ifFalse: [ ^ 0 ] ] ].
	^ 0"
	
	

]

{ #category : #private }
PoliticaCancelacionModerada >> diferenciaCantidadDiasDe: fechaMayor sobre: fechaMenor [
	^ fechaMayor subtractDays: fechaMenor
]

{ #category : #private }
PoliticaCancelacionModerada >> esDeHaceDosDias: fechaTentativaCancelacion fechaInicio: fechaInicio [
	^ (self
		diferenciaCantidadDiasDe: fechaInicio
		sobre: fechaTentativaCancelacion) >= 2
]

{ #category : #private }
PoliticaCancelacionModerada >> esDeHaceUnaSemana: fechaTentativaCancelacion fechaInicio: fechaInicio [
	^ (self
		diferenciaCantidadDiasDe: fechaInicio
		sobre: fechaTentativaCancelacion) >= 7
]
