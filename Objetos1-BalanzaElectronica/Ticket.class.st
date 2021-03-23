Class {
	#name : #Ticket,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'cantidadDeProductos',
		'pesoTotal',
		'precioTotal'
	],
	#category : #'Objetos1-BalanzaElectronica'
}

{ #category : #accessing }
Ticket >> cantidadDeProductos [ 
	^cantidadDeProductos 
]

{ #category : #accessing }
Ticket >> cantidadDeProductos: aProductsQuantity [
	cantidadDeProductos := aProductsQuantity 
]

{ #category : #queries }
Ticket >> equals: aDouble [
	^self = aDouble 
]

{ #category : #accessing }
Ticket >> fecha [ 
	^fecha
]

{ #category : #accessing }
Ticket >> fecha: aDate [ 
	fecha:= aDate
	
]

{ #category : #queries }
Ticket >> impuesto [
	"el impuesto es el 21% del precio total"
^ precioTotal * 0.21
]

{ #category : #accessing }
Ticket >> pesoTotal [ 
	^pesoTotal 
]

{ #category : #accessing }
Ticket >> pesoTotal: aTotalWeight [
	pesoTotal := aTotalWeight 
]

{ #category : #accessing }
Ticket >> precioTotal [
	^precioTotal 
]

{ #category : #accessing }
Ticket >> precioTotal: aTotalPrice [
	precioTotal := aTotalPrice 
]
