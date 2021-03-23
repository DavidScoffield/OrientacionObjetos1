Class {
	#name : #BalanzaTest2,
	#superclass : #TestCase,
	#instVars : [
		'balanza',
		'queso',
		'jamon'
	],
	#category : #'Objetos1-BalanzaElectronicaMejoradaSkeleton-Tests'
}

{ #category : #running }
BalanzaTest2 >> setUp [
	balanza := Balanza2 new.
	queso := Producto2 new.
	queso
		descripcion: 'Queso';
		peso: 0.1;
		precioPorKilo: 140.
	jamon := Producto2 new.
	jamon
		descripcion: 'Jamon';
		peso: 0.1;
		precioPorKilo: 90
]

{ #category : #testing }
BalanzaTest2 >> testAgregarProducto [
   balanza agregarProducto: queso.
	self assert: balanza pesoTotal equals: 0.1.
	self assert: balanza precioTotal equals: 14.
	self assert: balanza cantidadDeProductos equals: 1.
	
   balanza agregarProducto: jamon.
	self assert: balanza pesoTotal equals: 0.2.
	self assert: balanza precioTotal equals: 23.
	self assert: balanza cantidadDeProductos equals: 2
]

{ #category : #testing }
BalanzaTest2 >> testCantidadDeProductos [
	self assert: balanza cantidadDeProductos equals: 0.
	balanza agregarProducto: queso.
	self assert: balanza cantidadDeProductos equals: 1.
	balanza agregarProducto: jamon.
	self assert: balanza cantidadDeProductos equals: 2
]

{ #category : #testing }
BalanzaTest2 >> testEmitirTicket [
	| ticket |
	balanza agregarProducto: queso.
	balanza agregarProducto: jamon.
	ticket := balanza emitirTicket.
	self assert: ticket pesoTotal equals: 0.2.
	self assert: ticket precioTotal equals: 23.
	self assert: ticket cantidadDeProductos equals: 2.
	self assert: ticket impuesto equals: (23 * 0.21).
	self assert: ticket fecha equals: Date today

]

{ #category : #testing }
BalanzaTest2 >> testInitialize [
	self assert: balanza pesoTotal equals: 0.
	self assert: balanza precioTotal equals: 0.
	self assert: balanza cantidadDeProductos equals: 0
]

{ #category : #testing }
BalanzaTest2 >> testPesoTotal [
	self assert: balanza pesoTotal equals: 0.
	balanza agregarProducto: queso.
	self assert: balanza pesoTotal equals: 0.1.
	balanza agregarProducto: jamon.
	self assert: balanza pesoTotal equals: 0.2
]

{ #category : #testing }
BalanzaTest2 >> testPonerEnCero [
	balanza agregarProducto: queso.
	balanza ponerEnCero.
	self assert: balanza pesoTotal equals: 0.
	self assert: balanza precioTotal equals: 0.
	self assert: balanza cantidadDeProductos equals: 0
]

{ #category : #testing }
BalanzaTest2 >> testPrecioTotal [
	self assert: balanza precioTotal  equals: 0.
	balanza agregarProducto: queso.
	self assert: balanza precioTotal equals: 14.
	balanza agregarProducto: jamon.
	self assert: balanza precioTotal equals: 23
]
