Class {
	#name : #Balanza2,
	#superclass : #Object,
	#instVars : [
		'products'
	],
	#category : #'Objetos1-BalanzaElectronicaMejorada'
}

{ #category : #operations }
Balanza2 >> agregarProducto: aProduct [
	"cantidadDeProductos := cantidadDeProductos + 1."
	products add: aProduct .
	"pesoTotal := pesoTotal + aProduct peso.
	precioTotal := precioTotal + aProduct precio"
]

{ #category : #accessing }
Balanza2 >> cantidadDeProductos [
	"^cantidadDeProductos"
	^products size .
]

{ #category : #operations }
Balanza2 >> emitirTicket [
	"Devuelve el ticket del producto"

	| ticket |
	ticket := Ticket2 new.
	ticket fecha: Date today.
	ticket pesoTotal: self pesoTotal.
	ticket precioTotal: self precioTotal.
	"ticket cantidadDeProductos: cantidadDeProductos ."
	ticket cantidadDeProductos: products size.
	ticket products: products .	
	^ ticket
]

{ #category : #initialization }
Balanza2 >> initialize [
	"cantidadDeProductos := 0.
	precioTotal := 0.
	pesoTotal := 0"
	products := OrderedCollection new.
	"self ponerEnCero."
	
]

{ #category : #accessing }
Balanza2 >> pesoTotal [
	|totalWeight|
	totalWeight :=0.
	products do: [ :each | totalWeight := totalWeight + each peso ].
	^totalWeight 
]

{ #category : #operations }
Balanza2 >> ponerEnCero [
	"Pone en cero la balanza"
	products removeAll .
	"cantidadDeProductos := 0."
	"precioTotal := 0.
	pesoTotal := 0"
]

{ #category : #accessing }
Balanza2 >> precioTotal [
	"^precioTotal "
	|totalPrice|
	totalPrice := 0.
	products do: [ :each | totalPrice := totalPrice + each precio ].
	^totalPrice
]

{ #category : #accessing }
Balanza2 >> products [
	^products
]
