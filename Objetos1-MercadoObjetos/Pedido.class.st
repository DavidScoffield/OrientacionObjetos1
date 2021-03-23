Class {
	#name : #Pedido,
	#superclass : #Object,
	#instVars : [
		'producto',
		'cliente',
		'cantidadSolicidata',
		'mecanismoEnvio',
		'metodoPago'
	],
	#category : #'Objetos1-MercadoObjetos'
}

{ #category : #'instance creation' }
Pedido class >> newConProducto: unProducto cliente: unCliente cantidad: unaCantidad mecanismo: unMecanismoEnvio pago: unMetodoPago [
	^ self new
		initializeConProducto: unProducto
			cliente: unCliente
			cantidad: unaCantidad
			mecanismo: unMecanismoEnvio
			pago: unMetodoPago;
		yourself
]

{ #category : #operations }
Pedido >> calcularCosto [
	| precio |
	precio := self precioBase .
	precio := precio + (metodoPago calcularCosto: self)
		+ (mecanismoEnvio calcularCosto: self).
	^ precio
]

{ #category : #accessing }
Pedido >> cliente [
	^cliente
]

{ #category : #initialization }
Pedido >> initializeConProducto: unProducto cliente: unCliente cantidad: unaCantidad mecanismo: unMecanismoEnvio pago: unMetodoPago [
	producto := unProducto.
	cliente := unCliente.
	cantidadSolicidata := unaCantidad.
	mecanismoEnvio := unMecanismoEnvio.
	metodoPago := unMetodoPago
]

{ #category : #private }
Pedido >> precioBase [
	^producto precio * cantidadSolicidata 
]

{ #category : #accessing }
Pedido >> producto [
	^producto 
]
