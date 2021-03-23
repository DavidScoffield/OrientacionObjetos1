Class {
	#name : #Item,
	#superclass : #Object,
	#instVars : [
		'detalle',
		'cantidad',
		'costoUnitario'
	],
	#category : #'Objetos1-Presupuesto-Model '
}

{ #category : #accessing }
Item >> cantidad: aQuantity [
	cantidad := aQuantity 
]

{ #category : #queries }
Item >> costo [ 
	^ cantidad * costoUnitario 
]

{ #category : #accessing }
Item >> costoUnitario [
	^costoUnitario 
]

{ #category : #accessing }
Item >> costoUnitario: aUnitaryCost [
	costoUnitario := aUnitaryCost 
]

{ #category : #accessing }
Item >> detalle: aDetail [
	detalle := aDetail  
]
