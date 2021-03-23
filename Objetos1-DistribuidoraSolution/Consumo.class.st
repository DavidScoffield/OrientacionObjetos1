Class {
	#name : #Consumo,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'consumoEnergiaReactiva',
		'consumoEnergiaActiva'
	],
	#category : #'Objetos1-DistribuidoraSolution-model'
}

{ #category : #'intance creation' }
Consumo class >> activa: kwh reactiva: karph [
	^self new activa: kwh reactiva: karph
]

{ #category : #accessing }
Consumo >> activa [
	^consumoEnergiaActiva
]

{ #category : #accessing }
Consumo >> activa: kwh reactiva: karph [
	consumoEnergiaActiva := kwh.
	consumoEnergiaReactiva := karph.
]

{ #category : #accessing }
Consumo >> costoEnBaseA: precioKWh [
	^consumoEnergiaActiva * precioKWh 
]

{ #category : #accessing }
Consumo >> factorDePotencia [
	^consumoEnergiaActiva / ((consumoEnergiaActiva squared) + (consumoEnergiaReactiva squared)) sqrt.
]

{ #category : #accessing }
Consumo >> fecha [
	^fecha
]

{ #category : #initialize }
Consumo >> initialize [
	fecha := Date today.
]

{ #category : #accessing }
Consumo >> reactiva [
	^consumoEnergiaReactiva
]
