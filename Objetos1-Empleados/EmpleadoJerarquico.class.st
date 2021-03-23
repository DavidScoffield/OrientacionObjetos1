Class {
	#name : #EmpleadoJerarquico,
	#superclass : #Empleado,
	#category : #'Objetos1-Empleados'
}

{ #category : #'as yet unclassified' }
EmpleadoJerarquico >> bonoPorCategoria [
	^ 200
]

{ #category : #accessing }
EmpleadoJerarquico >> calcularSueldo [
	^ self sueldoBasico + self bonoPorCategoria
]

{ #category : #'as yet unclassified' }
EmpleadoJerarquico >> montoBasico [
	^ 850
]
