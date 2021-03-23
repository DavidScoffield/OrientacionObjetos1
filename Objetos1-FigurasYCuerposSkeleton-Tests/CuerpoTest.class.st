Class {
	#name : #CuerpoTest,
	#superclass : #TestCase,
	#instVars : [
		'cilindro',
		'prisma'
	],
	#category : #'Objetos1-FigurasYCuerposSkeleton-Tests'
}

{ #category : #tests }
CuerpoTest >> setUp [
	cilindro := Cuerpo new
		altura: 5;
		caraBasal: (Circulo new radio: 3);
		yourself.
	prisma := Cuerpo new
		altura: 7;
		caraBasal: (Cuadrado new lado: 3);
		yourself
]

{ #category : #tests }
CuerpoTest >> testAltura [
	self assert: prisma altura equals: 7.
	self assert: cilindro altura equals: 5
]

{ #category : #tests }
CuerpoTest >> testSuperficieExterior [
	"La superficie exterior de un cuerpo es: 
 2* area-cara-basal + perimetro-cara-basal * altura-del-cuerpo"

	self assert: prisma superficieExterior equals: 2 * 9 + (12 * 7).
	self assert: cilindro superficieExterior closeTo: 2 * 28.2743 + (18.8495 * 5)
]

{ #category : #tests }
CuerpoTest >> testVolumen [
	"El volumen de un cuerpo es: area-cara-basal * altura"

	self assert: cilindro volumen closeTo: 28.2743 * 5.
	self assert: prisma volumen equals: 63
]
