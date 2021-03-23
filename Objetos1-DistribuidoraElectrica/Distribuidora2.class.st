Class {
	#name : #Distribuidora2,
	#superclass : #Object,
	#instVars : [
		'precioKWh',
		'usuarios'
	],
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #queries }
Distribuidora2 >> agregarUsuario: usuario [ 
	usuarios add: usuario 
]

{ #category : #queries }
Distribuidora2 >> consumoTotalActiva [
	^usuarios sumNumbers: [ :usuario | usuario ultimoConsumoActiva  ]
]

{ #category : #queries }
Distribuidora2 >> facturar [
	|facturas|
	facturas := usuarios collect: [ :usuario | usuario facturarEnBaseA: precioKWh ].
	^ facturas
]

{ #category : #initialization }
Distribuidora2 >> initialize [ 
	usuarios := OrderedCollection new.
]

{ #category : #queries }
Distribuidora2 >> precioKWh [
	^precioKWh
]

{ #category : #queries }
Distribuidora2 >> precioKWh: unPrecioKWh [
	precioKWh := unPrecioKWh 
]
