Class {
	#name : #FacturaTest,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraSolution-tests'
}

{ #category : #testing }
FacturaTest >> testConstructor [
	| factura |
	factura := Factura
		monto: 10
		descuento: 2
		fecha: Date today
		de: Usuario new.
	self assert: factura monto equals: 10.
	self assert: factura descuento equals: 2.
	self assert: factura fecha equals: Date today.
	self assert: factura usuario notNil
]

{ #category : #testing }
FacturaTest >> testMontoTotal [
	| factura |
	factura := Factura monto: 10 descuento: 2 fecha: Date today de: Usuario new.
	self assert: factura montoTotal equals: 8.
	
]
