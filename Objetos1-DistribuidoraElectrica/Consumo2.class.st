Class {
	#name : #Consumo2,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'consumoEnergiaActiva',
		'consumoEnergiaReactiva'
	],
	#category : #'Objetos1-DistribuidoraElectrica'
}

{ #category : #accessing }
Consumo2 >> consumoEnergiaActiva [
	^consumoEnergiaActiva 
]

{ #category : #accessing }
Consumo2 >> consumoEnergiaActiva: unConsumo [
	consumoEnergiaActiva := unConsumo 
]

{ #category : #accessing }
Consumo2 >> consumoEnergiaReactiva [
	^consumoEnergiaReactiva 
]

{ #category : #accessing }
Consumo2 >> consumoEnergiaReactiva: unConsumo [
	consumoEnergiaReactiva := unConsumo 
]

{ #category : #queries }
Consumo2 >> costoEnBaseA: precioKWh [
	^consumoEnergiaActiva * precioKWh 
]

{ #category : #queries }
Consumo2 >> factorDePotencia [
	^ consumoEnergiaActiva / (((consumoEnergiaActiva squared) + (consumoEnergiaReactiva squared)) sqrt ) .
]

{ #category : #accessing }
Consumo2 >> fecha [
	^fecha
]

{ #category : #accessing }
Consumo2 >> fecha: unaFecha [
	fecha := unaFecha
]

{ #category : #initialization }
Consumo2 >> initialize [ 
	fecha:= Date today.
]
