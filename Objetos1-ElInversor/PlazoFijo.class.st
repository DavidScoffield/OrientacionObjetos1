Class {
	#name : #PlazoFijo,
	#superclass : #Inversion,
	#instVars : [
		'fechaDeConstitucion',
		'montoDepositado',
		'porcentajeDeInteresDiario'
	],
	#category : #'Objetos1-ElInversor'
}

{ #category : #'instance initialization' }
PlazoFijo class >> newConMonto: monto porcentaje: porcentaje [
	^ self new
		initializeConMonto: monto porcentaje: porcentaje;
		yourself
]

{ #category : #accessing }
PlazoFijo >> fechaDeConstitucion [
	^fechaDeConstitucion 
]

{ #category : #accessing }
PlazoFijo >> fechaDeConstitucion: fecha [
	fechaDeConstitucion := fecha
]

{ #category : #initialization }
PlazoFijo >> initializeConMonto: monto porcentaje: porcentaje [ 
	fechaDeConstitucion := Date today.
	montoDepositado := monto.
	porcentajeDeInteresDiario := porcentaje 
]

{ #category : #accessing }
PlazoFijo >> montoDepositado [ 	
	^montoDepositado 
]

{ #category : #accessing }
PlazoFijo >> montoDepositado: monto [ 	
	montoDepositado := monto
]

{ #category : #accessing }
PlazoFijo >> porcentajeDeInteresDiario [ 	
	^porcentajeDeInteresDiario 
]

{ #category : #accessing }
PlazoFijo >> porcentajeDeInteresDiario: porcentaje [ 	
	porcentajeDeInteresDiario := porcentaje 
]

{ #category : #operations }
PlazoFijo >> valorActual [
	| interesPorDia cantidadDiasPasados |
	interesPorDia := montoDepositado * porcentajeDeInteresDiario.
	cantidadDiasPasados := (Date today - fechaDeConstitucion) asDays.
	^ (cantidadDiasPasados * interesPorDia) + montoDepositado
]
