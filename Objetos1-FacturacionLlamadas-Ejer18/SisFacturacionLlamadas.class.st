Class {
	#name : #SisFacturacionLlamadas,
	#superclass : #Object,
	#instVars : [
		'telefonosDisponibles',
		'registrosLLamadas',
		'clientes'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #operations }
SisFacturacionLlamadas >> agregarTelefono: nro [
	telefonosDisponibles add: nro.
]

{ #category : #'private ' }
SisFacturacionLlamadas >> calcularMontoLlamadas: llamadas [
	^ llamadas sumNumbers: [ :llamada | llamada calcularCosto ]
]

{ #category : #operations }
SisFacturacionLlamadas >> darAltaClientePerFisica: nombre direccion: direccion dni: dni [
	| cliente telefono |
	telefono := telefonosDisponibles removeFirst.
	cliente := ClientePersonaFisica
		newConNombre: nombre
		direccion: direccion
		telefono: telefono
		dni: dni.
	^ clientes add: cliente
]

{ #category : #operations }
SisFacturacionLlamadas >> darAltaClientePerJuridica: nombre direccion: direccion cuit: cuit tipoPersonaJuridica: tipoPersonaJuridica [
	| cliente telefono |
	telefono := telefonosDisponibles removeFirst.
	cliente := ClientePersonaJuridica
		newConNombre: nombre
		direccion: direccion
		telefono: telefono
		cuit: cuit
		tipo: tipoPersonaJuridica.
	^ clientes add: cliente
]

{ #category : #operations }
SisFacturacionLlamadas >> facturarLlamadasPara: cliente entre: fechaIni y: fechaFin [
	| llamadas montoTotal |
	llamadas := self llamadasDe: cliente entre: fechaIni y: fechaFin.
	montoTotal := (self calcularMontoLlamadas: llamadas) * cliente descuento.
	^ FacturaLlamadas
		newConCliente: cliente
		fechaInicio: fechaIni
		fechaFin: fechaFin
		montoTotal: montoTotal
]

{ #category : #initialization }
SisFacturacionLlamadas >> initialize [
	telefonosDisponibles := OrderedCollection new.
	registrosLLamadas := OrderedCollection new.
	clientes := OrderedCollection new
]

{ #category : #'private ' }
SisFacturacionLlamadas >> llamadasDe: cliente entre: fechaIni y: fechaFin [
	^ registrosLLamadas
		select: [ :llamada | 
			llamada telefonoQueLlama = cliente telefono
				and: [ llamada fecha between: fechaIni and: fechaFin ] ]
]

{ #category : #operations }
SisFacturacionLlamadas >> registrarLlamadaInternacional: fecha hora: hora duracionMin: duracionMin telefonoQueLlama: telefonoL telefonoQueRecibe: telefonoR paisOri: paisOrigen paisDest: paisDestino [
	| registro |
	registro := RegistroLlamadaInternacional
		newConFecha: fecha
		hora: hora
		duracion: duracionMin
		telefonoLlama: telefonoL
		telefonoRecibe: telefonoR
		paisOri: paisOrigen
		paisDest: paisDestino.
	^ registrosLLamadas add: registro
]

{ #category : #operations }
SisFacturacionLlamadas >> registrarLlamadaInterurbana: fecha hora: hora duracionMin: duracionMin telefonoQueLlama: telefonoL telefonoQueRecibe: telefonoR distancia: distancia [
	| registro |
	registro := RegistroLlamadaInterurbana
		newConFecha: fecha
		hora: hora
		duracion: duracionMin
		telefonoLlama: telefonoL
		telefonoRecibe: telefonoR
		distancia: distancia.
	^ registrosLLamadas add: registro
]

{ #category : #operations }
SisFacturacionLlamadas >> registrarLlamadaLocal: fecha hora: hora duracionMin: duracionMin telefonoQueLlama: telefonoL telefonoQueRecibe: telefonoR [
	| registro |
	registro := RegistroLlamadaLocal
		newConFecha: fecha
		hora: hora
		duracion: duracionMin
		telefonoLlama: telefonoL
		telefonoRecibe: telefonoR.
	^ registrosLLamadas add: registro
]
