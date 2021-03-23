Class {
	#name : #Gerente,
	#superclass : #EmpleadoJerarquico,
	#category : #'Objetos1-Empleados'
}

{ #category : #'as yet unclassified' }
Gerente >> aportes [
	^ self montoBasico * 0.05
]

{ #category : #'as yet unclassified' }
Gerente >> montoBasico [
	^ 1000
]
