Class {
	#name : #SistemaLiquidacion,
	#superclass : #Object,
	#instVars : [
		'empleados'
	],
	#category : #'Objetos1-LiquidacionHaberes-Ejer19'
}

{ #category : #queries }
SistemaLiquidacion >> buscarEmpleado: cuil [
	^empleados detect: [ :empleado | empleado cuil = cuil ]
]

{ #category : #operations }
SistemaLiquidacion >> darDeAltaEmpleado: nombre apellido: apellido cuil: cuil fechaNacimiento: fechaNac tieneConyugue: tieneConyugue tieneHijos: tieneHijos [
	empleados
		add:
			(EmpleadoLiquidacion
				newConNombre: nombre
				apellido: apellido
				cuil: cuil
				fechaNacimiento: fechaNac
				tieneConyugue: tieneConyugue
				tieneHijos: tieneHijos)
]

{ #category : #operations }
SistemaLiquidacion >> darDeBajaEmpleado: empleado [
	empleados remove: empleado
]

{ #category : #accessing }
SistemaLiquidacion >> generarRecibosSueldo [
	| empleadosConContratosVigentes |
	empleadosConContratosVigentes := empleados
		reject: [ :empleado | empleado tieneContratoVencidoHoy ].
		
	^ empleadosConContratosVigentes
		collect: [ :empleado | empleado generarReciboSueldo ]
]

{ #category : #initialization }
SistemaLiquidacion >> initialize [ 
	empleados:= OrderedCollection new.
]

{ #category : #queries }
SistemaLiquidacion >> obtenerEmpleadosConContratosVencidos [
	^empleados select: [ :empleado | empleado tieneContratoVencidoHoy ]
]
