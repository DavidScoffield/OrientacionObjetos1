Class {
	#name : #DistribuidoraTest2,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #testing }
DistribuidoraTest2 >> testConstructor [
	| edelap |
	edelap := Distribuidora2 new precioKWh: 8.
	self assert: edelap precioKWh equals: 8.
	
]

{ #category : #testing }
DistribuidoraTest2 >> testConsumoTotalActiva [
	| edelap usuario  |
	edelap := Distribuidora2 new precioKWh: 1.
	self assert: edelap facturar isEmpty.
	usuario := Usuario2 new nombre: 'Alberto Picapiedras'; domicilio: 'Diagonal 85, nro 73'.
	"un usuario"
	edelap agregarUsuario: usuario.
	usuario agregarMedicion: (Consumo2  new consumoEnergiaActiva: 10; consumoEnergiaReactiva: 0).
	usuario agregarMedicion: (Consumo2 new consumoEnergiaActiva: 1 ; consumoEnergiaReactiva: 0).
	"otro usuario"
	usuario := Usuario2 new nombre: 'Maria Picapiedras' ;domicilio: 'Diagonal 85, nro 74'.
	edelap agregarUsuario: usuario.
	usuario agregarMedicion: (Consumo2 new consumoEnergiaActiva: 10 ; consumoEnergiaReactiva: 0).
	usuario agregarMedicion: (Consumo2 new consumoEnergiaActiva: 2 ; consumoEnergiaReactiva: 0).
	
	self assert: edelap consumoTotalActiva equals: 3.
]

{ #category : #testing }
DistribuidoraTest2 >> testFacturar [
	| edelap usuario facturas |
	edelap := Distribuidora2 new precioKWh: 1.
	self assert: edelap facturar isEmpty.
	usuario := Usuario2 new nombre: 'Alberto Picapiedras'; domicilio: 'Diagonal 85, nro 73'.
	edelap agregarUsuario: usuario.
	usuario agregarMedicion: (Consumo2 new consumoEnergiaActiva: 1; consumoEnergiaReactiva: 0).
	facturas := edelap facturar.
	self assert: facturas notEmpty.
	self assert: facturas first usuario equals: usuario
]
