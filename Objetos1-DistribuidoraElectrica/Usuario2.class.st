Class {
	#name : #Usuario2,
	#superclass : #Object,
	#instVars : [
		'domicilio',
		'nombre',
		'facturas',
		'consumos'
	],
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #accesing }
Usuario2 >> agregarMedicion: medicion [
	consumos add: medicion.
]

{ #category : #private }
Usuario2 >> calcularDescuento: monto [
	^(self ultimoConsumo factorDePotencia  > 0.8) ifTrue: [ ^monto * 0.1 ] ifFalse: [ ^0 ]
]

{ #category : #accesing }
Usuario2 >> domicilio [
	^domicilio 
]

{ #category : #accesing }
Usuario2 >> domicilio: unDomicilio [
	domicilio := unDomicilio 
]

{ #category : #facturar }
Usuario2 >> facturarEnBaseA: precioKWh [
	|costoTotal factura |
	costoTotal:= self ultimoConsumo costoEnBaseA: precioKWh .
	factura:= Factura2 new montoEnergiaActiva: costoTotal ;
		usuario: self;
		fecha: Date today;
		descuento: (self calcularDescuento: costoTotal) .
	^facturas add: factura.
]

{ #category : #accesing }
Usuario2 >> facturas [
	^facturas
]

{ #category : #initialization }
Usuario2 >> initialize [ 
	facturas := OrderedCollection new.
	consumos := OrderedCollection new.
]

{ #category : #accesing }
Usuario2 >> nombre [
	^nombre 
]

{ #category : #accesing }
Usuario2 >> nombre: unNombre [
	nombre := unNombre 
]

{ #category : #facturar }
Usuario2 >> ultimoConsumo [ 
	^consumos ifEmpty: [ ^nil ] ifNotEmpty: [ ^(consumos asSortedCollection: [:a :b | a fecha > b fecha ]) first ] 
]

{ #category : #facturar }
Usuario2 >> ultimoConsumoActiva [
	^ self ultimoConsumo ifNil: [ 0 ] ifNotNil: [ self ultimoConsumo consumoEnergiaActiva ]
]
