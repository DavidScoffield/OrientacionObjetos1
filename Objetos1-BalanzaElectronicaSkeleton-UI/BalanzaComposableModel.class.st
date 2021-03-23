"
Soy la UI de una Balanza. Solo conozco a la balanza. 
Ella hace todo. 

Por ahora me actualizo cuando yo envio mensajes al modelo.
Lo correcto sería hacerlo cuando el modelo cambia (dependencias)
"
Class {
	#name : #BalanzaComposableModel,
	#superclass : #ComposableModel,
	#instVars : [
		'balanza',
		'ponerEnCeroButton',
		'agregarProductoButton',
		'precioTotalLabel',
		'pesoTotalLabel',
		'cantidadLabel',
		'emitirComprobanteButton'
	],
	#category : #'Objetos1-BalanzaElectronicaSkeleton-UI'
}

{ #category : #spec }
BalanzaComposableModel class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :row | 
			row
				newColumn: [ :col | 
					col
						add: #cantidadLabel;
						add: #pesoTotalLabel;
						add: #precioTotalLabel ].
			row
				newColumn: [ :col | 
					col
						add: #ponerEnCeroButton;
						add: #agregarProductoButton;
						add: #emitirComprobanteButton ] ]
			height: 100;
		yourself
]

{ #category : #private }
BalanzaComposableModel >> agregar: cantidad aPrecio: precioPorKilo [
	| producto |
	producto := Producto new.
	producto peso: cantidad.
	producto precioPorKilo: precioPorKilo.
	self balanza agregarProducto: producto
]

{ #category : #actions }
BalanzaComposableModel >> agregarProducto [
	| cantidad precioPorKilo confirmado |
	[ cantidad := (UIManager default request: 'Cantidad de producto en Kg') asNumber ]
		on: Error
		do: [ :ex | cantidad := 0 ].
	[ precioPorKilo := (UIManager default request: 'Precio por Kg') asNumber ]
		on: Error
		do: [ :ex | precioPorKilo := 0 ].
	confirmado := UIManager default
		confirm:
			'Usted agregara ' , cantidad asString , ' Kg, a un precio de $' , precioPorKilo asString
				, ' por Kg'.
	confirmado
		ifTrue: [ self agregar: cantidad aPrecio: precioPorKilo ].
	self updateLabels
]

{ #category : #accessing }
BalanzaComposableModel >> agregarProductoButton [
	^ agregarProductoButton
]

{ #category : #accessing }
BalanzaComposableModel >> agregarProductoButton: anObject [
	agregarProductoButton := anObject
]

{ #category : #accessing }
BalanzaComposableModel >> balanza [
	^ balanza
]

{ #category : #accessing }
BalanzaComposableModel >> balanza: anObject [
	balanza := anObject
]

{ #category : #accessing }
BalanzaComposableModel >> cantidadInput [
	^ cantidadInput
]

{ #category : #accessing }
BalanzaComposableModel >> cantidadInput: anObject [
	cantidadInput := anObject
]

{ #category : #accessing }
BalanzaComposableModel >> cantidadLabel [
	^ cantidadLabel
]

{ #category : #accessing }
BalanzaComposableModel >> cantidadLabel: anObject [
	cantidadLabel := anObject
]

{ #category : #actions }
BalanzaComposableModel >> emitirComprobante [
	| label |
	label := self newText.
	label disable.
	label text: (self textoParaComprobante: self balanza emitirTicket).
	label openWithSpec
]

{ #category : #accessing }
BalanzaComposableModel >> emitirComprobanteButton [
	^ emitirComprobanteButton
]

{ #category : #accessing }
BalanzaComposableModel >> emitirComprobanteButton: anObject [
	emitirComprobanteButton := anObject
]

{ #category : #api }
BalanzaComposableModel >> extent [
  ^ 400@140
]

{ #category : #initialization }
BalanzaComposableModel >> initialize [
	balanza := Balanza new.
	super initialize
]

{ #category : #initialization }
BalanzaComposableModel >> initializePresenter [
	ponerEnCeroButton action: [ self ponerEnCero ].
	agregarProductoButton action: [ self agregarProducto ].
	emitirComprobanteButton action: [ self emitirComprobante ]
]

{ #category : #initialization }
BalanzaComposableModel >> initializeWidgets [
	precioTotalLabel := self newLabel.
	pesoTotalLabel := self newLabel.
	cantidadLabel := self newLabel.
	self updateLabels.
	ponerEnCeroButton := self newButton.
	ponerEnCeroButton label: 'Cero'.
	agregarProductoButton := self newButton.
	agregarProductoButton label: 'Agregar producto'.
	emitirComprobanteButton := self newButton.
	emitirComprobanteButton label: 'Emitir comprobante'
]

{ #category : #accessing }
BalanzaComposableModel >> pesoTotalInput [
	^ pesoTotalInput
]

{ #category : #accessing }
BalanzaComposableModel >> pesoTotalInput: anObject [
	pesoTotalInput := anObject
]

{ #category : #accessing }
BalanzaComposableModel >> pesoTotalLabel [
	^ pesoTotalLabel
]

{ #category : #accessing }
BalanzaComposableModel >> pesoTotalLabel: anObject [
	pesoTotalLabel := anObject
]

{ #category : #actions }
BalanzaComposableModel >> ponerEnCero [
	self balanza ponerEnCero.
	self updateLabels
]

{ #category : #accessing }
BalanzaComposableModel >> ponerEnCeroButton [
	^ ponerEnCeroButton
]

{ #category : #accessing }
BalanzaComposableModel >> ponerEnCeroButton: anObject [
	ponerEnCeroButton := anObject
]

{ #category : #accessing }
BalanzaComposableModel >> precioTotalInput [
	^ precioTotalInput
]

{ #category : #accessing }
BalanzaComposableModel >> precioTotalInput: anObject [
	precioTotalInput := anObject
]

{ #category : #accessing }
BalanzaComposableModel >> precioTotalLabel [
	^ precioTotalLabel
]

{ #category : #accessing }
BalanzaComposableModel >> precioTotalLabel: anObject [
	precioTotalLabel := anObject
]

{ #category : #private }
BalanzaComposableModel >> textoParaComprobante: comprobante [
	| str |
	str := 'Comprobante de balanza\' withCRs asText allBold.
	str := str , '  Fecha: ' , comprobante fecha asString , '\' withCRs.
	str := str , '  Cantidad de productos: ' , comprobante cantidadDeProductos asString
		, '\' withCRs.
	str := str , '  Peso total: ' , comprobante pesoTotal asString , ' kg\' withCRs.
	str := str , '  Precio total: $' , comprobante precioTotal asString , '\' withCRs.
	str := str , '  Impuesto: $' , comprobante impuesto asString.
	^ str
]

{ #category : #api }
BalanzaComposableModel >> title [
  ^ 'Una balanza electronica'.
]

{ #category : #updating }
BalanzaComposableModel >> updateLabels [
	precioTotalLabel
		label: 'Precio total: ' , self balanza precioTotal asString.
	pesoTotalLabel
		label: 'Peso total: ' , self balanza pesoTotal asString.
	cantidadLabel
		label: 'Productos cargados: ' , self balanza cantidadDeProductos asString
]
