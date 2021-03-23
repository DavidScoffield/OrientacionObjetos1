Class {
	#name : #CajaAhorro,
	#superclass : #Cuenta,
	#category : #'Objetos1-CuentaConGanchos'
}

{ #category : #operations }
CajaAhorro >> extraerSinControlar: monto [.
	 super extraerSinControlar: (monto * 1.02)
]

{ #category : #verification }
CajaAhorro >> puedeExtraer: monto [ 
	^ (saldo >= (monto * 1.02))
]
