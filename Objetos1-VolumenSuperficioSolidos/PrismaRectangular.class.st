Class {
	#name : #PrismaRectangular,
	#superclass : #Pieza,
	#instVars : [
		'altura',
		'ladoMayor',
		'ladoMenor'
	],
	#category : #'Objetos1-VolumenSuperficioSolidos'
}

{ #category : #accessing }
PrismaRectangular >> altura: unaAltura [
	altura := unaAltura
]

{ #category : #accessing }
PrismaRectangular >> ladoMayor: mayor [
	ladoMayor := mayor 
]

{ #category : #accessing }
PrismaRectangular >> ladoMenor: menor [
	ladoMenor := menor
]

{ #category : #accessing }
PrismaRectangular >> superficie [
	^ (2 * ladoMenor * ladoMayor ) + (2 * ladoMenor * altura ) + (2 * ladoMayor * altura )
]

{ #category : #accessing }
PrismaRectangular >> volumen [ 
	^ ladoMayor * ladoMenor * altura 
]
