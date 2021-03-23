Class {
	#name : #Balanza,
	#superclass : #Object,
	#instVars : [
		'cantidadDeProductos',
		'precioTotal',
		'pesoTotal'
	],
	#category : #'Objetos1-BalanzaElectronica'
}

{ #category : #operations }
Balanza >> agregarProducto: aProduct [
	cantidadDeProductos := cantidadDeProductos + 1.
	pesoTotal := pesoTotal + aProduct peso.
	precioTotal := precioTotal + aProduct precio
]

{ #category : #accessing }
Balanza >> cantidadDeProductos [
	^cantidadDeProductos
]

{ #category : #operations }
Balanza >> emitirTicket [
	"Devuelve el ticket del producto"
	|ticket|
	ticket := Ticket new.
	ticket fecha: (Date today).
	ticket pesoTotal: pesoTotal .
	ticket precioTotal: precioTotal .
	ticket cantidadDeProductos: cantidadDeProductos .
	^ticket 
]

{ #category : #initialization }
Balanza >> initialize [
	"cantidadDeProductos := 0.
	precioTotal := 0.
	pesoTotal := 0"
	self ponerEnCero.
	
]

{ #category : #accessing }
Balanza >> pesoTotal [
	^pesoTotal 
]

{ #category : #operations }
Balanza >> ponerEnCero [
	"Pone en cero la balanza"
	cantidadDeProductos := 0.
	precioTotal := 0.
	pesoTotal := 0
]

{ #category : #accessing }
Balanza >> precioTotal [
	^precioTotal 
]
