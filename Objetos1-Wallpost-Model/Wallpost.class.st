Class {
	#name : #Wallpost,
	#superclass : #Object,
	#instVars : [
		'text',
		'likesQuantity',
		'featured'
	],
	#category : #'Objetos1-Wallpost-Model'
}

{ #category : #accessing }
Wallpost >> dislike [ 
"Decrementa la cantidad de likes en uno. Si ya es 0, no hace nada"
	likesQuantity > 0 ifTrue: [ likesQuantity := likesQuantity - 1 ]
]

{ #category : #initialization }
Wallpost >> initialize [ 
"Inicializa el estado de las variables de instancia del Wallpost. Luego de la invocación el Wallpost debe tener como texto: “Undefined post”, no debe estar marcado como destacado y la cantidad de “Me gusta” deben ser 0."
	
	text := 'Undefined post'.
	featured := false.
	likesQuantity := 0
]

{ #category : #accessing }
Wallpost >> isFeatured [ 
"Retorna true si el post está marcado como destacado, false en caso contrario"
	^ featured 
]

{ #category : #accessing }
Wallpost >> like [ 
"Incrementa la cantidad de likes en uno"
	likesQuantity := likesQuantity + 1
]

{ #category : #accessing }
Wallpost >> likes [ 
"Retorna la cantidad de “me gusta”"
	^ likesQuantity 
]

{ #category : #accessing }
Wallpost >> text [ 
"Retorna el texto descriptivo de la publicación"
	^text
]

{ #category : #accessing }
Wallpost >> text: descriptionText [ 
"Setea el texto descriptivo de la publicación"
	text := descriptionText 
]

{ #category : #accessing }
Wallpost >> toggleFeatured [ 
"Cambia el post del estado destacado a no destacado y viceversa"
	featured := featured not   
	
]
