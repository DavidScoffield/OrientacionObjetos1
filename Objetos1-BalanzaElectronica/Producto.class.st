Class {
	#name : #Producto,
	#superclass : #Object,
	#instVars : [
		'peso',
		'precioPorKilo',
		'descripcion'
	],
	#category : #'Objetos1-BalanzaElectronica'
}

{ #category : #accessing }
Producto >> descripcion [
	^descripcion 
]

{ #category : #accessing }
Producto >> descripcion: aDescription [
	descripcion := aDescription 
]

{ #category : #accessing }
Producto >> peso [ 
	^peso
]

{ #category : #accessing }
Producto >> peso: aWeight [
	peso := aWeight  
]

{ #category : #calculations }
Producto >> precio [ 
	"Devuelve el precio en base al peso y el peso por kilo"
	^ precioPorKilo * peso
]

{ #category : #accessing }
Producto >> precioPorKilo [
	^precioPorKilo 
]

{ #category : #accessing }
Producto >> precioPorKilo: aPricePerKilo [
	precioPorKilo := aPricePerKilo 
 	
]
