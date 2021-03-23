Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'consumos',
		'facturas',
		'domicilio',
		'nombre'
	],
	#category : #'Objetos1-DistribuidoraSolution'
}

{ #category : #'instance creation' }
Usuario class >> newCon: unNombre y: unaContraseña [ 
	 ^ self
]

{ #category : #creation }
Usuario class >> nombre: nombre domicilio: unDomicilio [
	^ self new
		domicilio: unDomicilio;
		nombre: nombre;
		yourself
]

{ #category : #accessing }
Usuario >> agregarConsumo: consumo [
	consumos add: consumo.
]

{ #category : #private }
Usuario >> calcularDescuento: monto [
	^(self ultimoConsumo factorDePotencia) >= 0.8 ifTrue: [ ^monto *  0.1] ifFalse:[ ^0 ]
	
]

{ #category : #accessing }
Usuario >> domicilio [
	^ domicilio
]

{ #category : #accessing }
Usuario >> domicilio: unDomicilio [
	domicilio := unDomicilio.
]

{ #category : #facturar }
Usuario >> facturarEnBaseA: precioKWh [
	| costoTotal |
	costoTotal := self ultimoConsumo costoEnBaseA: precioKWh.
	^ facturas
		add:
			(Factura
				monto: costoTotal
				descuento: (self calcularDescuento: costoTotal)
				fecha: Date today
				de: self)
	"Notar que el mensaje #add: devuelve el elemento agregado."
]

{ #category : #accessing }
Usuario >> facturas [
	^ facturas
]

{ #category : #initialize }
Usuario >> initialize [
	consumos := OrderedCollection new.
	facturas := OrderedCollection new.
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #accessing }
Usuario >> nombre: anObject [
	nombre := anObject
]

{ #category : #facturar }
Usuario >> ultimoConsumo [
	consumos
		ifEmpty: [ ^ nil ]
		ifNotEmpty: [ ^ (consumos asSortedCollection: [ :a :b | a fecha > b fecha ]) first ]
]

{ #category : #facturar }
Usuario >> ultimoConsumoActiva [
	^ self ultimoConsumo ifNil: [ 0 ] ifNotNil: [ self ultimoConsumo activa ]
]

{ #category : #facturar }
Usuario >> ultimoConsumoReactiva [
	^ self ultimoConsumo ifNil: [ 0 ] ifNotNil: [ self ultimoConsumo reactiva ]
]
