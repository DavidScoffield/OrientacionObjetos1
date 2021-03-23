Class {
	#name : #Factura,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'monto',
		'descuento',
		'usuario'
	],
	#category : #'Objetos1-DistribuidoraSolution-model'
}

{ #category : #creation }
Factura class >> monto: monto descuento: descuento fecha: fecha de: usuario [
	^self new monto: monto descuento: descuento fecha: fecha de: usuario.


]

{ #category : #accessing }
Factura >> descuento [
	^ descuento
]

{ #category : #accessing }
Factura >> fecha [
	^ fecha
]

{ #category : #accessing }
Factura >> monto [
	^ monto
]

{ #category : #initialize }
Factura >> monto: costoTotal descuento: descuentoTotal fecha: fechaFacturacion de: unUsuario [
	monto := costoTotal.
	descuento := descuentoTotal.
	fecha := fechaFacturacion.
	usuario := unUsuario.
]

{ #category : #accessing }
Factura >> montoTotal [
	^monto - descuento
]

{ #category : #accessing }
Factura >> usuario [
	^ usuario
]
