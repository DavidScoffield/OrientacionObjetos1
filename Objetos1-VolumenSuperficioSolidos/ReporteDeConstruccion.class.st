Class {
	#name : #ReporteDeConstruccion,
	#superclass : #Object,
	#instVars : [
		'piezas'
	],
	#category : #'Objetos1-VolumenSuperficioSolidos'
}

{ #category : #initialization }
ReporteDeConstruccion >> initialize [ 
	piezas:= OrderedCollection new.
]

{ #category : #operations }
ReporteDeConstruccion >> superficieDeColor: unNombreDeColor [
  "Recibe como parametro un color (un string, por ejemplo 'Rojo'). Retorna la suma de las superficies externas de todas las piezas pintadas con ese color"
	|coleccionColor|
	coleccionColor  := piezas collect: [ :pieza | pieza color = unNombreDeColor  ].
	^coleccionColor sumNumbers: [ :pieza | pieza superficie ]
]

{ #category : #operations }
ReporteDeConstruccion >> volumenDeMaterial: nombreDeUnMaterial [
	"Recibe como parámetro un nombre de material (un string, por ejemplo 'Hierro'). Retorna la suma de los volúmenes de todas las piezas hechas en ese material"
	|coleccionMaterial|
	coleccionMaterial := piezas collect: [ :pieza | pieza material = nombreDeUnMaterial ].
	^coleccionMaterial sumNumbers: [ :pieza | pieza volumen ]

	
]
