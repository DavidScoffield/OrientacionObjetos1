Class {
	#name : #Mercado,
	#superclass : #Object,
	#instVars : [
		'vendedores',
		'clientes',
		'productos',
		'pedidos'
	],
	#category : #'Objetos1-MercadoObjetos'
}

{ #category : #queries }
Mercado >> buscarCliente: nombre [
	^ clientes
		detect: [ :cliente | cliente nombre = nombre ]
		ifNone: [ nil ]
]

{ #category : #queries }
Mercado >> buscarProducto: nombre [
	^ productos 
		select: [ :producto | producto nombre = nombre ]
]

{ #category : #queries }
Mercado >> buscarVendedor: nombre [
	^ vendedores
		detect: [ :vendedor | vendedor nombre = nombre ]
		ifNone: [ nil ]
]

{ #category : #accessing }
Mercado >> crearPedidoDe: cliente delProducto: producto conCantidad: cantidad formaPago: formaPago mecanismoEnvio: mecanismoEnvio [
	cantidad <= producto cantidadUnidades
		ifTrue: [ | pedido |
			pedido := Pedido
				newConProducto: producto
				cliente: cliente
				cantidad: cantidad
				mecanismo: mecanismoEnvio
				pago: formaPago.
			producto actualizarCantidadUnidadesDisponibles: cantidad.
			^ pedidos add: pedido ]
]

{ #category : #initialization }
Mercado >> initialize [
	vendedores := OrderedCollection new.
	clientes := OrderedCollection new.
	productos := OrderedCollection new.
	pedidos := OrderedCollection new
]

{ #category : #operations }
Mercado >> ponerProductoAVentaConNombre: nombre descripcion: descripcion precio: precio cantUnidades: cantidad vendedor: vendedor [
	| producto |
	producto := ProductoM
		newConNombre: nombre
		descripcion: descripcion
		precio: precio
		cantidad: cantidad
		vendedor: vendedor.
	^productos add: producto
]

{ #category : #operations }
Mercado >> registrarCliente: unNombre direccion: unaDireccion [
	| cliente |
	cliente := Persona newConNombre: unNombre direccion: unaDireccion.
	^ clientes add: cliente
]

{ #category : #operations }
Mercado >> registrarVendedor: unNombre direccion: unaDireccion [
	| vendedor |
	vendedor := Persona newConNombre: unNombre direccion: unaDireccion.
	^ vendedores add: vendedor
]
