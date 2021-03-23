Class {
	#name : #EmpleadoLiquidacion,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'cuil',
		'fechaNacimiento',
		'tieneConyugue',
		'tieneHijos',
		'fechaIngreso',
		'contratoVigente',
		'contratosVencidos'
	],
	#category : #'Objetos1-LiquidacionHaberes-Ejer19'
}

{ #category : #'instance creation' }
EmpleadoLiquidacion class >> newConNombre: unNombre apellido: unApellido cuil: unCuil fechaNacimiento: unaFechaNacimiento tieneConyugue: siTieneConyugue tieneHijos: siTieneHijos [
	^ self new
		initializeConNombre: unNombre
			apellido: unApellido
			cuil: unCuil
			fechaNacimiento: unaFechaNacimiento
			tieneConyugue: siTieneConyugue
			tieneHijos: siTieneHijos;
		yourself
]

{ #category : #private }
EmpleadoLiquidacion >> calcularAntiguedad [
	^ ((Date today subtractDate: fechaIngreso) / 365) asInteger
]

{ #category : #private }
EmpleadoLiquidacion >> calcularMontoAntiguedad [
	| antiguedad |
	antiguedad := self calcularAntiguedad.
	
	antiguedad >= 20 ifTrue: [ ^ 2 ].
	antiguedad >= 15 ifTrue: [ ^ 1.7 ].
	antiguedad >= 10 ifTrue: [ ^ 1.5 ].
	antiguedad >= 5  ifTrue: [ ^ 1.3 ].
	^ 1
]

{ #category : #private }
EmpleadoLiquidacion >> calcularMontoTotal [
	| basico portentajePorAntiguedad |
	basico := contratoVigente montoACobrar.
	portentajePorAntiguedad := self calcularMontoAntiguedad.
	^ basico * portentajePorAntiguedad
]

{ #category : #operations }
EmpleadoLiquidacion >> cargarContratoDePlantaConFechaInicio: fechaInicio sueldoMensual: sueldoMensual montoPorConyugue: montoPorConyugue montoPorHijos: montoPorHijos [
	| contrato |
	contrato := ContratoDePlanta
		newConFechaInicio: fechaInicio
		sueldoMensual: sueldoMensual
		montoPorConyugue: montoPorConyugue
		montoPorHijos: montoPorHijos

	"Donde lo agrego"
]

{ #category : #operations }
EmpleadoLiquidacion >> cargarContratoPorHorasConFechaInicio: fechaInicio valorHora: valorHora nroHorasMes: nroHoras fechaFin: fechaFin [
	| contrato |
	contrato := ContratoPorHoras
		newConFechaInicio: fechaInicio
		fechaFin: fechaFin
		nroHoras: nroHoras
		valorHora: valorHora.
		
	"Donde lo agrego"
]

{ #category : #accessing }
EmpleadoLiquidacion >> cuil [ 
	^cuil 
]

{ #category : #operations }
EmpleadoLiquidacion >> generarReciboSueldo [
	^ ReciboSueldo
		newConNombre: nombre
		apellido: apellido
		cuil: cuil
		antiguedad: self calcularAntiguedad
		montoTotal: self calcularMontoTotal
]

{ #category : #initialization }
EmpleadoLiquidacion >> initializeConNombre: unNombre apellido: unApellido cuil: unCuil fechaNacimiento: unaFechaNacimiento tieneConyugue: siTieneConyugue tieneHijos: siTieneHijos [
	nombre := unNombre.
	apellido := unApellido.
	cuil := unCuil.
	fechaIngreso := Date today.
	fechaNacimiento := unaFechaNacimiento.
	tieneConyugue := siTieneConyugue.
	tieneHijos := siTieneHijos.
	contratosVencidos := OrderedCollection new
]

{ #category : #queries }
EmpleadoLiquidacion >> tieneContratoVencidoHoy [
	contratoVigente ifNotNil: [ ^ contratoVigente estaVencido ].
	^ false
]

{ #category : #accessing }
EmpleadoLiquidacion >> tieneConyugue [
	^tieneConyugue 
]

{ #category : #accessing }
EmpleadoLiquidacion >> tieneHijos [
	^tieneHijos 
]
