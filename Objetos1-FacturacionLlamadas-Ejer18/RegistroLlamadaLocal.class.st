Class {
	#name : #RegistroLlamadaLocal,
	#superclass : #RegistroLlamada,
	#category : #'Objetos1-FacturacionLlamadas-Ejer18'
}

{ #category : #'instance creation' }
RegistroLlamadaLocal class >> newConFecha: fecha hora: hora duracion: duracion telefonoLlama: telefonoQueLlama telefonoRecibe: telefonoQueRecibe [
	^ self
		newConFecha: fecha
			hora: hora
			duracion: duracion
			telefonoLlama: telefonoQueLlama
			telefonoRecibe: telefonoQueRecibe;
		yourself
]

{ #category : #operations }
RegistroLlamadaLocal >> calcularCosto [
	^ duracionMin
]
