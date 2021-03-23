Class {
	#name : #ConsumoTest2,
	#superclass : #TestCase,
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #testing }
ConsumoTest2 >> testConstructor [
	| unConsumo |
	unConsumo := Consumo2 new
		consumoEnergiaActiva: 1;
		consumoEnergiaReactiva: 2.
	self assert: unConsumo consumoEnergiaActiva equals: 1.
	self assert: unConsumo consumoEnergiaReactiva equals: 2.
	self assert: unConsumo fecha equals: Date today
]

{ #category : #testing }
ConsumoTest2 >> testCostoEnBaseA [
	| unConsumo |
	unConsumo := Consumo2 new
		consumoEnergiaActiva: 1;
		consumoEnergiaReactiva: 2.
	self assert: (unConsumo costoEnBaseA: 5) equals: 5
]

{ #category : #testing }
ConsumoTest2 >> testFactorDePotencia [
	| unConsumo |
	unConsumo := Consumo2 new
		consumoEnergiaActiva: 1;
		consumoEnergiaReactiva: 2.
	self assert: (unConsumo factorDePotencia closeTo: 1 / 5 sqrt)
]
