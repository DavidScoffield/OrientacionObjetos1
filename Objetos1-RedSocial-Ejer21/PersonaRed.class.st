Class {
	#name : #PersonaRed,
	#superclass : #Object,
	#instVars : [
		'conocidos',
		'nombre',
		'apellido',
		'edad'
	],
	#category : #'Objetos1-RedSocial-Ejer21'
}

{ #category : #'instance creation' }
PersonaRed class >> newConNombre: unNombre apellido: unApellido edad: unaEdad [
	^ self new
		initializeConNombre: unNombre apellido: unApellido edad: unaEdad;
		yourself
]

{ #category : #accessing }
PersonaRed >> apellido [
	^apellido
]

{ #category : #queries }
PersonaRed >> conoceA: unaPersona [
	^conocidos includes: unaPersona 
]

{ #category : #operations }
PersonaRed >> conocerA: persona [
	conocidos add: persona
]

{ #category : #accessing }
PersonaRed >> conocidos [
	^conocidos 
]

{ #category : #accessing }
PersonaRed >> edad [
	^edad
]

{ #category : #queries }
PersonaRed >> egoNetworkconProfundidad2: profundidad [
	| set |
	set := Set new.
	self egoNetworkconProfundidad: profundidad set: set.
	^ set
]

{ #category : #queries }
PersonaRed >> egoNetworkconProfundidad: profundidad [
	| set |
	profundidad < 1
		ifTrue: [ ^ self error: 'Invalid parameter' ].
	set := Set new.
	profundidad = 1
		ifFalse: [ "[ set
				addAll:
					(conocidos
						collect:
							[ :conocido | conocido egoNetworkconProfundidad: profundidad - 1 ])
						flattened ]."
			(conocidos
				flatCollect: [ :conocido | conocido egoNetworkconProfundidad: profundidad - 1 ])
				asSet ].
	set addAll: conocidos.
	^ set
]

{ #category : #'private - queries' }
PersonaRed >> egoNetworkconProfundidad: profundidad set: set [
	profundidad < 1
		ifTrue: [ ^ self error: 'Invalid parameter' ].
	profundidad = 1
		ifFalse: [ conocidos
				do: [ :conocido | 
					(set includes: conocido)
						ifFalse: [ conocido egoNetworkconProfundidad: profundidad - 1 set: set ] ] ].
	set addAll: conocidos
]

{ #category : #initialization }
PersonaRed >> initializeConNombre: unNombre apellido: unApellido edad: unaEdad [
	nombre := unNombre.
	apellido := unApellido.
	edad := unaEdad.
	conocidos := Set new
]

{ #category : #accessing }
PersonaRed >> nombre [
	^ nombre
]
