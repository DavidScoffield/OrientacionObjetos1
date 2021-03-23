Class {
	#name : #ProductoM,
	#superclass : #Object,
	#instVars : [
		'vendedor',
		'nombre',
		'descripcion',
		'precio',
		'cantidadUnidades'
	],
	#category : #'Objetos1-MercadoObjetos'
}

{ #category : #'instance creation' }
ProductoM class >> newConNombre: unNombre descripcion: unaDescripcion precio: unPrecio cantidad: unaCantidad vendedor: unVendedor [
	^ self new
		initializeConNombre: unNombre
			descripcion: unaDescripcion
			precio: unPrecio
			cantidad: unaCantidad
			vendedor: unVendedor;
		yourself
]

{ #category : #operations }
ProductoM >> actualizarCantidadUnidadesDisponibles: cantidad [
	cantidadUnidades := cantidadUnidades - cantidad
]

{ #category : #accessing }
ProductoM >> cantidadUnidades [
	^ cantidadUnidades
]

{ #category : #initialization }
ProductoM >> initializeConNombre: unNombre descripcion: unaDescripcion precio: unPrecio cantidad: unaCantidad vendedor: unVendedor [
	nombre := unNombre.
	descripcion := unaDescripcion.
	precio := unPrecio.
	cantidadUnidades := unaCantidad.
	vendedor := unVendedor
]

{ #category : #accessing }
ProductoM >> nombre [
	^ nombre
]

{ #category : #accessing }
ProductoM >> precio [
	^precio
]

{ #category : #accessing }
ProductoM >> vendedor [
	^ vendedor
]
