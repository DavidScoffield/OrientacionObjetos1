Class {
	#name : #DateLapse,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Objetos1-IntervaloTiempo'
}

{ #category : #'instance creation' }
DateLapse class >> date1: aDate1 date2: aDate2 [
	^self new from: aDate1 to: aDate2
]

{ #category : #accessing }
DateLapse >> cantidadDiasSuperpuestosCon: otroLapso [
	
]

{ #category : #accessing }
DateLapse >> from [
	"Retorna la fecha de inicio del rango"
	^from
]

{ #category : #private }
DateLapse >> from: aDateFrom to: aDateTo [
	"Es un metodo privado que asigna la fecha inicial y final de un objeto DateLapse"

	from := aDateFrom.
	to := aDateTo
]

{ #category : #accessing }
DateLapse >> includesDate: aDate [
	"recibe un objeto Date y retorna true si la fecha está entre el from y el to del receptor y false en caso contrario"

	^aDate between: from and: to 
	
]

{ #category : #accessing }
DateLapse >> numberOfOverlappingDays: anotherDateLapse [
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
DateLapse >> overlaps: anotherDateLapse [
	"recibe un objeto DateLapse y retorna true si el período de tiempo del receptor se superpone con el recibido por 	parámetro"

	^ (self to <= anotherDateLapse from
		or: [ self from >= anotherDateLapse to ]) not




	"^ (self includesDate: anotherDateLapse from)
		or: [ self includesDate: anotherDateLapse to ]
		"
]

{ #category : #accessing }
DateLapse >> sizeInDays [
	"retorna la cantidad de dias entre la fecha 'from' y la fecha 'to'"
	^(to subtractDate: from)
	"^(to - from) asDays asInteger "
	
]

{ #category : #accessing }
DateLapse >> to [
	"Retorna la fecha de fin del rango"

	^ to
]
