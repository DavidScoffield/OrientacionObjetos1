Class {
	#name : #Producto2,
	#superclass : #Object,
	#instVars : [
		'peso',
		'precioPorKilo',
		'descripcion'
	],
	#category : #'Objetos1-BalanzaElectronicaMejorada'
}

{ #category : #accessing }
Producto2 >> descripcion [
	^descripcion 
]

{ #category : #accessing }
Producto2 >> descripcion: aDescription [
	descripcion := aDescription 
]

{ #category : #accessing }
Producto2 >> peso [ 
	^peso
]

{ #category : #accessing }
Producto2 >> peso: aWeight [
	peso := aWeight  
]

{ #category : #calculations }
Producto2 >> precio [ 
	"Devuelve el precio en base al peso y el peso por kilo"
	^ precioPorKilo * peso
]

{ #category : #accessing }
Producto2 >> precioPorKilo [
	^precioPorKilo 
]

{ #category : #accessing }
Producto2 >> precioPorKilo: aPricePerKilo [
	precioPorKilo := aPricePerKilo 
 	
]
