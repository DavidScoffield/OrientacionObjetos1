Class {
	#name : #MecanismoRetirarComercioTest,
	#superclass : #TestCase,
	#instVars : [
		'mecanismo',
		'pedido'
	],
	#category : #'Objetos1-MercadoObjetos-Test'
}

{ #category : #running }
MecanismoRetirarComercioTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	| producto |

	producto := ProductoM
		newConNombre: 'MyPhone 3'
		descripcion: 'El teléfono que siempre quisiste'
		precio: 8600
		cantidad: 40
		vendedor: (Persona
		newConNombre: 'Todo lindo'
		direccion: 'Calle 16, Nº90, La Plata').

	pedido := Pedido
		newConProducto: producto
		cliente: (Persona
		newConNombre: 'Juan Delos Palotes'
		direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: (MecanismoRetirarComercio new)
		pago: (PagoAlContado new).
		
	mecanismo:= MecanismoRetirarComercio new.
]

{ #category : #tests }
MecanismoRetirarComercioTest >> testCalcularCosto [ 
	self assert: (mecanismo calcularCosto: pedido) equals: 0.
]
