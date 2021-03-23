Class {
	#name : #Mamifero,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'especie',
		'fechaDeNacimiento',
		'padre',
		'madre',
		'familyCollection'
	],
	#category : #'Objetos1-GenealogiaSalvaje '
}

{ #category : #'accessing methods' }
Mamifero class >> withIdentifier: aId species: aSpecie dateOfBirth: aDate father: aFather mother: aMother [
	^ self new
		initializeMammal: aId
		species: aSpecie
		dateOfBirth: aDate
		father: aFather
		mother: aMother
]

{ #category : #accessing }
Mamifero >> abuelaMaterna [
	^ madre ifNil: [ ^ nil ] ifNotNil: [ madre madre ]

]

{ #category : #accessing }
Mamifero >> abuelaPaterna [
	^ padre ifNil: [ ^ nil ] ifNotNil: [ padre madre ]
]

{ #category : #accessing }
Mamifero >> abueloMaterno [
	^ madre ifNil: [ ^ nil ] ifNotNil: [ madre padre ]
]

{ #category : #accessing }
Mamifero >> abueloPaterno [
	^ padre ifNil: [ ^ nil ] ifNotNil: [ padre padre ]
]

{ #category : #accessing }
Mamifero >> especie [
	^especie 
]

{ #category : #accessing }
Mamifero >> especie: unaEspecie [
	especie := unaEspecie 
]

{ #category : #accessing }
Mamifero >> familiares [
	^familyCollection.
]

{ #category : #accessing }
Mamifero >> fecha [ 
	^fechaDeNacimiento 
]

{ #category : #accessing }
Mamifero >> fechaDeNacimiento: fecha [ 
	fechaDeNacimiento := fecha
]

{ #category : #accessing }
Mamifero >> identificador [
	^identificador 
]

{ #category : #accessing }
Mamifero >> identificador: unIdentificador [
	identificador := unIdentificador .
]

{ #category : #initialization }
Mamifero >> initialize [ 
	familyCollection := OrderedCollection new.
	
]

{ #category : #initialization }
Mamifero >> initializeMammal: aId species: aSpecie dateOfBirth: aDate father: aFather mother: aMother [
	identificador := aId.
	especie := aSpecie.
	fechaDeNacimiento := aDate.
	padre := aFather.
	madre := aMother.
	familyCollection := OrderedCollection new.
	familyCollection
		add: aFather;
		add: aMother
]

{ #category : #accessing }
Mamifero >> madre [ 
	^madre
]

{ #category : #accessing }
Mamifero >> madre: laMadre [
	madre := laMadre.
	familyCollection add: madre.
]

{ #category : #accessing }
Mamifero >> padre [
 	^padre
]

{ #category : #accessing }
Mamifero >> padre: elPadre [
	padre := elPadre .
	familyCollection add: padre.
]

{ #category : #accessing }
Mamifero >> tieneAncestro: unMamifero [
	
	(familyCollection includes: unMamifero) ifTrue: [^true].

	^familyCollection
		anySatisfy: [ :each | each tieneAncestro: unMamifero ]



"NO FUNCIONA SI EL MAMIFERO ES SI MISMO"
	"| hasAncestor |
	hasAncestor := self = unMamifero.
	hasAncestor
		ifTrue: [ ^ hasAncestor ].
	
	padre isNotNil
		ifTrue: [ hasAncestor := padre tieneAncestro: unMamifero ].
	hasAncestor
		ifTrue: [ ^ hasAncestor ].
		
	madre isNotNil
		ifTrue: [ hasAncestor := madre tieneAncestro: unMamifero ].
	^ hasAncestor"
]
