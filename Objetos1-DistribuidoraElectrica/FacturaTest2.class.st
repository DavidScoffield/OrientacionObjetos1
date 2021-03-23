Class {
	#name : #FacturaTest2,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #testing }
FacturaTest2 >> testConstructor [
	| factura |
	factura := Factura2 new 
		montoEnergiaActiva: 10;
		descuento: 2;
		fecha: Date today;
		usuario: Usuario new.
	self assert: factura montoEnergiaActiva equals: 10.
	self assert: factura descuento equals: 2.
	self assert: factura fecha equals: Date today.
	self assert: factura usuario notNil
]

{ #category : #testing }
FacturaTest2 >> testMontoTotal [
	| factura |
	factura := Factura2 new 
	 montoEnergiaActiva: 10;
	 descuento: 2;
	 fecha: Date today;
	 usuario: Usuario new.
	self assert: factura montoTotal equals: 8.
	
]
