Class {
	#name : #Ticket2,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'cantidadDeProductos',
		'pesoTotal',
		'precioTotal',
		'products'
	],
	#category : #'Objetos1-BalanzaElectronicaMejorada'
}

{ #category : #accessing }
Ticket2 >> cantidadDeProductos [ 
	^cantidadDeProductos 
]

{ #category : #accessing }
Ticket2 >> cantidadDeProductos: aProductsQuantity [
	cantidadDeProductos := aProductsQuantity 
]

{ #category : #queries }
Ticket2 >> equals: aDouble [
	^self = aDouble 
]

{ #category : #accessing }
Ticket2 >> fecha [ 
	^fecha
]

{ #category : #accessing }
Ticket2 >> fecha: aDate [ 
	fecha:= aDate
	
]

{ #category : #queries }
Ticket2 >> impuesto [
	"el impuesto es el 21% del precio total"
^ precioTotal * 0.21
]

{ #category : #initialization }
Ticket2 >> initialize [ 
	products:= OrderedCollection new.
]

{ #category : #accessing }
Ticket2 >> pesoTotal [ 
	^pesoTotal 
]

{ #category : #accessing }
Ticket2 >> pesoTotal: aTotalWeight [
	pesoTotal := aTotalWeight 
]

{ #category : #accessing }
Ticket2 >> precioTotal [
	^precioTotal 
]

{ #category : #accessing }
Ticket2 >> precioTotal: aTotalPrice [
	precioTotal := aTotalPrice 
]

{ #category : #accessing }
Ticket2 >> products: aProducts [ 
	"products := aProducts "
	aProducts do: [ :each | products add: each ] 
]
