Class {
	#name : #Presupuesto,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'cliente',
		'items'
	],
	#category : #'Objetos1-Presupuesto-Model '
}

{ #category : #operations }
Presupuesto >> agregarItem: aItem [
	items add: aItem
]

{ #category : #operations }
Presupuesto >> calcularTotal [
	"|totalSum|
	totalSum := 0.
	items do: [ :each | totalSum := totalSum + each costo ]. 
	^totalSum"
	
	^items sumNumbers: [ :item | item costo ]
	
]

{ #category : #acessing }
Presupuesto >> cliente: aClient [
	cliente := aClient 
]

{ #category : #acessing }
Presupuesto >> fecha: aDate [ 
	fecha := aDate 
]

{ #category : #initialization }
Presupuesto >> initialize [ 
	"fecha:= (Date today)."
	cliente:= ''.
	items:= Set new.
]
