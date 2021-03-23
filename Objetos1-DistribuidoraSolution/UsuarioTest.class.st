Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraSolution-tests'
}

{ #category : #testing }
UsuarioTest >> testAgregarConsumo [
	| usuario consumo |
	usuario := Usuario nombre: 'Alberto Picapiedras' domicilio: 'Diagonal 85, nro 73'.
	consumo := Consumo activa: 1 reactiva: 2.
	usuario agregarConsumo: consumo.
	self assert: usuario ultimoConsumo equals: consumo.
	self assert: usuario ultimoConsumoActiva equals: 1.
	self assert: usuario ultimoConsumoReactiva equals: 2
]

{ #category : #testing }
UsuarioTest >> testCalcularDescuento [
	| usuario |
	usuario := Usuario nombre: 'Alberto Picapiedras' domicilio: 'Diagonal 85, nro 73'.
	usuario agregarConsumo: (Consumo activa: 1 reactiva: 0).
	self assert: (usuario calcularDescuento: 100) equals: 10.
	usuario agregarConsumo: (Consumo activa: 1 reactiva: 1).
	self assert: (usuario calcularDescuento: 100) equals: 0
]

{ #category : #testing }
UsuarioTest >> testConstructor [
	| usuario |
	usuario := Usuario nombre: 'Alberto Picapiedras' domicilio: 'Diagonal 85, nro 73'.
	self assert: usuario domicilio equals: 'Diagonal 85, nro 73'.
	self assert: usuario nombre equals: 'Alberto Picapiedras'.
	self assert: usuario ultimoConsumo isNil.
	self assert: usuario facturas isEmpty.
	self assert: usuario ultimoConsumoActiva equals: 0.
	self assert: usuario ultimoConsumoReactiva equals: 0
]

{ #category : #testing }
UsuarioTest >> testFacturarEnBaseA [
	| usuario factura |
	usuario := Usuario nombre: 'Alberto Picapiedras' domicilio: 'Diagonal 85, nro 73'.
	usuario agregarConsumo: (Consumo activa: 1 reactiva: 0).
	factura := usuario facturarEnBaseA: 1.
	self assert: factura notNil.
	self assert: usuario facturas size equals: 1
]
