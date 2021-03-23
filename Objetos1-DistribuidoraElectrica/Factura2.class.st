Class {
	#name : #Factura2,
	#superclass : #Object,
	#instVars : [
		'montoEnergiaActiva',
		'descuento',
		'fecha',
		'usuario'
	],
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #accessing }
Factura2 >> descuento [
	^descuento 
]

{ #category : #accessing }
Factura2 >> descuento: unDescuento [
	descuento := unDescuento 
]

{ #category : #accessing }
Factura2 >> fecha [ 		
	^fecha 
]

{ #category : #accessing }
Factura2 >> fecha: unaFecha [
	fecha:= unaFecha 
]

{ #category : #accessing }
Factura2 >> montoEnergiaActiva [
	^montoEnergiaActiva 
]

{ #category : #accessing }
Factura2 >> montoEnergiaActiva: unMonto [
	montoEnergiaActiva := unMonto 
]

{ #category : #accessing }
Factura2 >> montoTotal [
	^montoEnergiaActiva - descuento 
]

{ #category : #accessing }
Factura2 >> usuario [
	^usuario
]

{ #category : #accessing }
Factura2 >> usuario: unUsuario [ 
	usuario := unUsuario 
]
