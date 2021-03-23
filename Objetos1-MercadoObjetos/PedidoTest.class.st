Class {
	#name : #PedidoTest,
	#superclass : #TestCase,
	#instVars : [
		'pedidoAlContadoExpres',
		'pedidoAlContadoRetirarComercio',
		'pedidoAlContadoRetirarSucursal',
		'pedido6CuotasExpres',
		'pedido6CoutasRetirarComercio',
		'pedido6CuotasRetirarSucursal'
	],
	#category : #'Objetos1-MercadoObjetos-Test'
}

{ #category : #running }
PedidoTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	pedidoAlContadoExpres := Pedido
		newConProducto:
			(ProductoM
				newConNombre: 'MyPhone 3'
				descripcion: 'El teléfono que siempre quisiste'
				precio: 8600
				cantidad: 40
				vendedor:
					(Persona
						newConNombre: 'Todo lindo'
						direccion: 'Calle 16, Nº90, La Plata'))
		cliente:
			(Persona
				newConNombre: 'Juan Delos Palotes'
				direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: MecanismoExpres new
		pago: PagoAlContado new.
		
	pedidoAlContadoRetirarComercio := Pedido
		newConProducto:
			(ProductoM
				newConNombre: 'MyPhone 3'
				descripcion: 'El teléfono que siempre quisiste'
				precio: 8600
				cantidad: 40
				vendedor:
					(Persona
						newConNombre: 'Todo lindo'
						direccion: 'Calle 16, Nº90, La Plata'))
		cliente:
			(Persona
				newConNombre: 'Juan Delos Palotes'
				direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: MecanismoRetirarComercio new
		pago: PagoAlContado new.
		
	pedidoAlContadoRetirarSucursal := Pedido
		newConProducto:
			(ProductoM
				newConNombre: 'MyPhone 3'
				descripcion: 'El teléfono que siempre quisiste'
				precio: 8600
				cantidad: 40
				vendedor:
					(Persona
						newConNombre: 'Todo lindo'
						direccion: 'Calle 16, Nº90, La Plata'))
		cliente:
			(Persona
				newConNombre: 'Juan Delos Palotes'
				direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: MecanismoRetirarSucursalEnvio new
		pago: PagoAlContado new.
		
	pedido6CuotasExpres := Pedido
		newConProducto:
			(ProductoM
				newConNombre: 'MyPhone 3'
				descripcion: 'El teléfono que siempre quisiste'
				precio: 8600
				cantidad: 40
				vendedor:
					(Persona
						newConNombre: 'Todo lindo'
						direccion: 'Calle 16, Nº90, La Plata'))
		cliente:
			(Persona
				newConNombre: 'Juan Delos Palotes'
				direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: MecanismoExpres new
		pago: Pago6Cuotas new.
		
	pedido6CoutasRetirarComercio := Pedido
		newConProducto:
			(ProductoM
				newConNombre: 'MyPhone 3'
				descripcion: 'El teléfono que siempre quisiste'
				precio: 8600
				cantidad: 40
				vendedor:
					(Persona
						newConNombre: 'Todo lindo'
						direccion: 'Calle 16, Nº90, La Plata'))
		cliente:
			(Persona
				newConNombre: 'Juan Delos Palotes'
				direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: MecanismoRetirarComercio new
		pago: Pago6Cuotas new.
		
	pedido6CuotasRetirarSucursal := Pedido
		newConProducto:
			(ProductoM
				newConNombre: 'MyPhone 3'
				descripcion: 'El teléfono que siempre quisiste'
				precio: 8600
				cantidad: 40
				vendedor:
					(Persona
						newConNombre: 'Todo lindo'
						direccion: 'Calle 16, Nº90, La Plata'))
		cliente:
			(Persona
				newConNombre: 'Juan Delos Palotes'
				direccion: 'Mitre 3587, Cañuelas')
		cantidad: 2
		mecanismo: MecanismoRetirarSucursalEnvio new
		pago: Pago6Cuotas new
]

{ #category : #tests }
PedidoTest >> testCalcularCosto [
	self assert: pedidoAlContadoExpres calcularCosto equals: 17250.
	self assert: pedidoAlContadoRetirarComercio calcularCosto equals: 17200.
 	self assert: pedidoAlContadoRetirarSucursal  calcularCosto equals: 17250.
	
	self assert: pedido6CuotasExpres calcularCosto equals: 20690.
	self assert: pedido6CoutasRetirarComercio  calcularCosto equals: 20640.
	self assert: pedido6CuotasRetirarSucursal  calcularCosto equals: 20690.
]
