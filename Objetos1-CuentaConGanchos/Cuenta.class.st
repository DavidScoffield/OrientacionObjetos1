Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'saldo'
	],
	#category : #'Objetos1-CuentaConGanchos'
}

{ #category : #operations }
Cuenta >> depositar: monto [ 	
	saldo:= saldo + monto
]

{ #category : #operations }
Cuenta >> extraer: monto [
	(self puedeExtraer: monto)
		ifTrue: [ self extraerSinControlar: monto.
			^ true ].
	^ false
]

{ #category : #operations }
Cuenta >> extraerSinControlar: monto [
	saldo:= saldo - monto
]

{ #category : #initialization }
Cuenta >> initialize [
	saldo := 0.
]

{ #category : #verification }
Cuenta >> puedeExtraer: monto [ 
	self subclassResponsibility 
]

{ #category : #accesing }
Cuenta >> saldo [
	^saldo
]

{ #category : #operations }
Cuenta >> transferir: monto a: cuentaDestino [
	(self puedeExtraer: monto)
		ifTrue: [ self extraer: monto.
			cuentaDestino depositar: monto.
			^ true ].
	^ false
]
