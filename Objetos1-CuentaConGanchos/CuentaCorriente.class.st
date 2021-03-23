Class {
	#name : #CuentaCorriente,
	#superclass : #Cuenta,
	#instVars : [
		'limiteDescubierto'
	],
	#category : #'Objetos1-CuentaConGanchos'
}

{ #category : #initialization }
CuentaCorriente >> initialize [
	super initialize .
	limiteDescubierto := 0
]

{ #category : #accessing }
CuentaCorriente >> limiteDescubierto [
	^limiteDescubierto 
]

{ #category : #accessing }
CuentaCorriente >> limiteDescubierto: limite [ 
	limiteDescubierto := limite 
]

{ #category : #verification }
CuentaCorriente >> puedeExtraer: monto [ 
	^(saldo - monto + limiteDescubierto) >= 0  
]
