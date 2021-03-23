Class {
	#name : #ConsumoTest,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraSolution-tests'
}

{ #category : #testing }
ConsumoTest >> testConstructor [
	| unConsumo |
	unConsumo := Consumo activa: 1 reactiva: 2.
	self assert: unConsumo activa equals: 1.
	self assert: unConsumo reactiva equals: 2.
	self assert: unConsumo fecha equals: Date today
]

{ #category : #testing }
ConsumoTest >> testCostoEnBaseA [
	| unConsumo |
	unConsumo := Consumo activa: 1 reactiva: 2.
	self assert: (unConsumo costoEnBaseA: 5) equals: 5.

]

{ #category : #testing }
ConsumoTest >> testFactorDePotencia [
	| unConsumo |
	unConsumo := Consumo activa: 1 reactiva: 2.
	self assert: (unConsumo factorDePotencia closeTo: 1 / 5 sqrt).
]
