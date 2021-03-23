Class {
	#name : #InversionEnAcciones,
	#superclass : #Inversion,
	#instVars : [
		'nombreDeLaAccion',
		'cantidadDeAcciones',
		'valorActualPorAccion'
	],
	#category : #'Objetos1-ElInversor'
}

{ #category : #'instance initialization' }
InversionEnAcciones class >> newConNombre: nombre cantidadAcciones: cant valorActual: valor [
	^ self new
		initializeConNombre: nombre cantidad: cant valorActual: valor;
		yourself
]

{ #category : #accessing }
InversionEnAcciones >> cantidadDeAcciones [
	^cantidadDeAcciones 
]

{ #category : #accessing }
InversionEnAcciones >> cantidadDeAcciones: cant [
	cantidadDeAcciones := cant 
]

{ #category : #initialization }
InversionEnAcciones >> initializeConNombre: nombre cantidad: cantidad valorActual: valorActual [
	nombreDeLaAccion := nombre.
	cantidadDeAcciones := cantidad .
	valorActualPorAccion := valorActual 
]

{ #category : #accessing }
InversionEnAcciones >> nombreDeLaAccion [
	^nombreDeLaAccion  
]

{ #category : #accessing }
InversionEnAcciones >> nombreDeLaAccion: unNombre [
	nombreDeLaAccion := unNombre  
]

{ #category : #operations }
InversionEnAcciones >> valorActual [
	^cantidadDeAcciones * valorActualPorAccion 
]

{ #category : #accessing }
InversionEnAcciones >> valorActualPorAccion [
	^valorActualPorAccion
]

{ #category : #accessing }
InversionEnAcciones >> valorActualPorAccion: unValor [
	valorActualPorAccion := unValor 
]
