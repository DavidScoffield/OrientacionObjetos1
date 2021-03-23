Class {
	#name : #MecanismoExpres,
	#superclass : #Mecanismo,
	#category : #'Objetos1-MercadoObjetos'
}

{ #category : #operations }
MecanismoExpres >> calcularCosto: pedido [
	^ 0.5
		*
			(Mapa
				distanciaEntre: pedido producto vendedor direccion
				y: pedido cliente direccion)
]
