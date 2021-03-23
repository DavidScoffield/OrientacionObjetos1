Class {
	#name : #DateLapseWithoutTo,
	#superclass : #Object,
	#instVars : [
		'from',
		'sizeInDays'
	],
	#category : #'Objetos1-IntervaloTiempo'
}

{ #category : #accessing }
DateLapseWithoutTo >> from [
	"Retorna la fecha de inicio del rango"
	^from
]

{ #category : #private }
DateLapseWithoutTo >> from: aDateFrom to: aDateTo [
	"Es un metodo privado que asigna la fecha inicial y final de un objeto DateLapse"

	from := aDateFrom.
	sizeInDays := aDateTo subtractDate: aDateFrom .
	"sizeInDays := (aDateTo - aDateFrom) asDays asInteger "

]

{ #category : #accessing }
DateLapseWithoutTo >> includesDate: aDate [
	"recibe un objeto Date y retorna true si la fecha está entre el from y el to del receptor y false en caso contrario"

	^aDate between: from and: (self to ) 
	
]

{ #category : #accessing }
DateLapseWithoutTo >> numberOfOverlappingDays: anotherDateLapse [
	"^ (self overlaps: anotherDateLapse)
		ifTrue: [ (self to min: anotherDateLapse to)
				subtractDays: (self from max: anotherDateLapse from) ]
		ifFalse: [ 0 ]"

	^ (self overlaps: anotherDateLapse)
		ifTrue: [ | lapse |
			lapse := self class
				date1: (self from max: anotherDateLapse from)
				date2: (self to min: anotherDateLapse to).
			lapse sizeInDays ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
DateLapseWithoutTo >> overlaps: anotherDateLapse [
	"recibe un objeto DateLapse y retorna true si el período de tiempo del receptor se superpone con el recibido por 	parámetro"

	"^ (self includesDate: anotherDateLapse from)
		or: [ self includesDate: anotherDateLapse to ]
		"

	^ ((self to <= anotherDateLapse from)
		or: [ self from >= anotherDateLapse to ]) not
]

{ #category : #accessing }
DateLapseWithoutTo >> sizeInDays [
	"retorna la cantidad de dias entre la fecha 'from' y la fecha 'to'"

	^ sizeInDays 
]

{ #category : #accessing }
DateLapseWithoutTo >> to [
	"Retorna la fecha de fin del rango"

	^ from addDays: sizeInDays 
]
