Class {
	#name : #UsuarioTest2,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #testing }
UsuarioTest2 >> testAgregarConsumo [
	| usuario consumo |
	usuario := Usuario2 new  nombre: 'Alberto Picapiedras'; domicilio: 'Diagonal 85, nro 73'.
	consumo := Consumo2 new consumoEnergiaActiva: 1; consumoEnergiaReactiva: 2.
	usuario agregarMedicion: consumo.
	self assert: usuario ultimoConsumo equals: consumo.
	self assert: usuario ultimoConsumoActiva equals: 1.
	"self assert: usuario ultimoConsumoReactiva equals: 2"
]

{ #category : #testing }
UsuarioTest2 >> testCalcularDescuento [
	| usuario |
	usuario := Usuario2 new
		nombre: 'Alberto Picapiedras';
		domicilio: 'Diagonal 85, nro 73'.
	usuario
		agregarMedicion:
			(Consumo2 new
				consumoEnergiaActiva: 1;
				consumoEnergiaReactiva: 0).
	self assert: (usuario calcularDescuento: 100) equals: 10.
	usuario
		agregarMedicion:
			(Consumo2 new
				consumoEnergiaActiva: 1;
				consumoEnergiaReactiva: 1).
	self assert: (usuario calcularDescuento: 100) equals: 0
]

{ #category : #testing }
UsuarioTest2 >> testConstructor [
	| usuario |
	usuario := Usuario2 new nombre: 'Alberto Picapiedras'; domicilio: 'Diagonal 85, nro 73'.
	self assert: usuario domicilio equals: 'Diagonal 85, nro 73'.
	self assert: usuario nombre equals: 'Alberto Picapiedras'.
	self assert: usuario ultimoConsumo isNil.
	self assert: usuario facturas isEmpty.
	self assert: usuario ultimoConsumoActiva equals: 0.
	"self assert: usuario ultimoConsumoReactiva equals: 0"
]

{ #category : #testing }
UsuarioTest2 >> testFacturarEnBaseA [
	| usuario factura |
	usuario := Usuario2 new nombre: 'Alberto Picapiedras'; domicilio: 'Diagonal 85, nro 73'.
	usuario agregarMedicion: (Consumo2 new consumoEnergiaActiva: 1; consumoEnergiaReactiva: 0).
	factura := usuario facturarEnBaseA: 1.
	self assert: factura notNil.
	self assert: usuario facturas size equals: 1
]
