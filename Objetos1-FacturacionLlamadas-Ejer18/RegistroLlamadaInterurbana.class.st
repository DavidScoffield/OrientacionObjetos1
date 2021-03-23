Class {
	#name : #RegistroLlamadaInterurbana,
	#superclass : #RegistroLlamada,
	#instVars : [
		'distancia'
	],
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
RegistroLlamadaInterurbana class >> newConFecha: fecha hora: hora duracion: duracion telefonoLlama: telefonoQueLlama telefonoRecibe: telefonoQueRecibe distancia: distancia [
	^ (self
		newConFecha: fecha
		hora: hora
		duracion: duracion
		telefonoLlama: telefonoQueLlama
		telefonoRecibe: telefonoQueRecibe)
		initializeConDistancia: distancia;
		yourself
]

{ #category : #operations }
RegistroLlamadaInterurbana >> calcularCosto [
	"| costoPorMinuto |
	costoPorMinuto := (distancia < 100)
		ifTrue: [ 2 * duracionMin ]
		ifFalse: [ (distancia <= 500)
							ifTrue: [ 2.5 * duracionMin ]
							ifFalse: [ 3 * duracionMin ] ].
	^ 5 + costoPorMinuto"

	distancia < 100
		ifTrue: [ ^ 2 * duracionMin + 5 ].
		
	distancia >= 100 & (distancia < 500)
		ifTrue: [ ^ 2.5 * duracionMin + 5 ].
	
	distancia >= 500
		ifTrue: [ ^ 3 * duracionMin + 5 ]
]

{ #category : #initialization }
RegistroLlamadaInterurbana >> initializeConDistancia: unaDistancia [
	distancia := unaDistancia .	
]
