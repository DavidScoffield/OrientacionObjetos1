Class {
	#name : #Pago6Cuotas,
	#superclass : #Pago,
	#category : #'Objetos1-MercadoObjetos'
}

{ #category : #operations }
Pago6Cuotas >> calcularCosto: pedido [
	^ pedido precioBase * 0.2
]
