Class {
	#name : #PresupuestoTest,
	#superclass : #TestCase,
	#instVars : [
		'presupuesto'
	],
	#category : #'Objetos1-PresupuestoSkeleton-Tests'
}

{ #category : #running }
PresupuestoTest >> setUp [
	presupuesto := Presupuesto new.
	presupuesto fecha: Date today.
	presupuesto cliente: 'Juan de los Palotes'.
	
]

{ #category : #testing }
PresupuestoTest >> testCalcularTotal [
	| item |
	self assert: presupuesto calcularTotal = 0.
	item := Item new.
	item
		costoUnitario: 10;
		cantidad: 1.
	presupuesto agregarItem: item.
	self assert: presupuesto calcularTotal = 10.
	item := Item new.
	item
		costoUnitario: 10;
		cantidad: 1.
	presupuesto agregarItem: item.
	self assert: presupuesto calcularTotal = 20
]

{ #category : #testing }
PresupuestoTest >> testInitialize [
 self assert: presupuesto calcularTotal = 0.
]
