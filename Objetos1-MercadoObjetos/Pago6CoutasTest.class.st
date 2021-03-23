Class {
	#name : #Pago6CoutasTest,
	#superclass : #TestCase,
	#instVars : [
		'pago',
		'pedido'
	],
	#category : #'Objetos1-MercadoObjetos-Test'
}

{ #category : #running }
Pago6CoutasTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	| producto cliente mecanismo pago1 vendedor |
	vendedor := Persona
		newConNombre: 'Todo lindo'
		direccion: 'Calle 16, Nº90, La Plata'.
	producto := ProductoM
		newConNombre: 'MyPhone 3'
		descripcion: 'El teléfono que siempre quisiste'
		precio: 8600
		cantidad: 40
		vendedor: vendedor.
	cliente := Persona
		newConNombre: 'Juan Delos Palotes'
		direccion: 'Mitre 3587, Cañuelas'.
	mecanismo := MecanismoExpres new.
	pago1 := Pago6Cuotas new.
	pedido := Pedido
		newConProducto: producto
		cliente: cliente
		cantidad: 2
		mecanismo: mecanismo
		pago: pago1.
		
	pago:= Pago6Cuotas new.
]

{ #category : #tests }
Pago6CoutasTest >> testCalcularCosto [ 
	self assert: (pago calcularCosto: pedido) equals: 3440
	
]
