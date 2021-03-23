Class {
	#name : #Distribuidora,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'precioKWh'
	],
	#category : #'Objetos1-DistribuidoraSolution-model'
}

{ #category : #creation }
Distribuidora class >> precioKWh: precioKWh [
	^ self new
		precioKWh: precioKWh;
		yourself
]

{ #category : #model }
Distribuidora >> agregarUsuario: unUsuario [
	usuarios add: unUsuario.
	
]

{ #category : #model }
Distribuidora >> consumoTotalActiva [
	^usuarios sum:[:usuario | usuario ultimoConsumoActiva]
	"Notar que #sum: usa #inject:into:"
]

{ #category : #model }
Distribuidora >> facturar [
	^ usuarios collect: [ :usuario | usuario facturarEnBaseA: precioKWh ]
]

{ #category : #initialize }
Distribuidora >> initialize [
	usuarios := OrderedCollection new.
]

{ #category : #accessing }
Distribuidora >> precioKWh [
	^ precioKWh
]

{ #category : #model }
Distribuidora >> precioKWh: precio [
	precioKWh := precio.
	
]
