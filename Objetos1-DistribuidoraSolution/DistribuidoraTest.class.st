Class {
	#name : #DistribuidoraTest,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraSolution-tests'
}

{ #category : #testing }
DistribuidoraTest >> testConstructor [
	| edelap |
	edelap := Distribuidora precioKWh: 8.
	self assert: edelap precioKWh equals: 8.
	
]

{ #category : #testing }
DistribuidoraTest >> testConsumoTotalActiva [
	| edelap usuario  |
	edelap := Distribuidora precioKWh: 1.
	self assert: edelap facturar isEmpty.
	usuario := Usuario nombre: 'Alberto Picapiedras' domicilio: 'Diagonal 85, nro 73'.
	"un usuario"
	edelap agregarUsuario: usuario.
	usuario agregarConsumo: (Consumo activa: 10 reactiva: 0).
	usuario agregarConsumo: (Consumo activa: 1 reactiva: 0).
	"otro usuario"
	usuario := Usuario nombre: 'Maria Picapiedras' domicilio: 'Diagonal 85, nro 74'.
	edelap agregarUsuario: usuario.
	usuario agregarConsumo: (Consumo activa: 10 reactiva: 0).
	usuario agregarConsumo: (Consumo activa: 2 reactiva: 0).
	
	self assert: edelap consumoTotalActiva equals: 3.
]

{ #category : #testing }
DistribuidoraTest >> testFacturar [
	| edelap usuario facturas |
	edelap := Distribuidora precioKWh: 1.
	self assert: edelap facturar isEmpty.
	usuario := Usuario nombre: 'Alberto Picapiedras' domicilio: 'Diagonal 85, nro 73'.
	edelap agregarUsuario: usuario.
	usuario agregarConsumo: (Consumo activa: 1 reactiva: 0).
	facturas := edelap facturar.
	self assert: facturas notEmpty.
	self assert: facturas first usuario equals: usuario
]
