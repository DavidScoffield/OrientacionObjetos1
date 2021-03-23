Class {
	#name : #PersonaRedTest,
	#superclass : #TestCase,
	#instVars : [
		'david',
		'marcos'
	],
	#category : #'Objetos1-RedSocial-Ejer21-Test'
}

{ #category : #running }
PersonaRedTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	david:= PersonaRed newConNombre: 'david' apellido: 'sco'  edad: 19.
	marcos:= PersonaRed newConNombre: 'marcos' apellido: 'sco'  edad: 19.
	
	
	 
]

{ #category : #tests }
PersonaRedTest >> testConoceA [
	self deny: (david conoceA: marcos).
	david conocerA: marcos.
	self assert: (david conoceA: marcos)
]

{ #category : #tests }
PersonaRedTest >> testConocerA [
	self deny: (david conoceA: marcos).
	david conocerA: marcos.
	self assert: (david conoceA: marcos)
]

{ #category : #tests }
PersonaRedTest >> testEgoNetworkConProfundidad [
	| profundidad p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 set |
	profundidad := 2.
	p1 := PersonaRed newConNombre: '1' apellido: 's' edad: 19.
	p2 := PersonaRed newConNombre: '2' apellido: 's' edad: 19.
	p3 := PersonaRed newConNombre: '3' apellido: 's' edad: 19.
	p4 := PersonaRed newConNombre: '4' apellido: 's' edad: 19.
	p5 := PersonaRed newConNombre: '5' apellido: 's' edad: 19.
	p6 := PersonaRed newConNombre: '6' apellido: 's' edad: 19.
	p7 := PersonaRed newConNombre: '7' apellido: 's' edad: 19.
	p8 := PersonaRed newConNombre: '8' apellido: 's' edad: 19.
	p9 := PersonaRed newConNombre: '9' apellido: 's' edad: 19.
	p10 := PersonaRed newConNombre: '10' apellido: 's' edad: 19.
	p11 := PersonaRed newConNombre: '11' apellido: 's' edad: 19.
	p12 := PersonaRed newConNombre: '12' apellido: 's' edad: 19.
	p13 := PersonaRed newConNombre: '13' apellido: 's' edad: 19.
	p14 := PersonaRed newConNombre: '14' apellido: 's' edad: 19.
	p15 := PersonaRed newConNombre: '15' apellido: 's' edad: 19.
	p1
		conocerA: p2;
		conocerA: p3;
		conocerA: p4;
		conocerA: p5.
	p2
		conocerA: p3;
		conocerA: p4;
		conocerA: p6;
		conocerA: p12.
	p3
		conocerA: p7;
		conocerA: p2;
		conocerA: p9;
		conocerA: p1.
	p4
		conocerA: p2;
		conocerA: p1;
		conocerA: p9.
	p5
		conocerA: p8;
		conocerA: p4.
	p6 conocerA: p10.
	p7 conocerA: p11.
	p8 conocerA: p1.
	p11 conocerA: p15.
	set := p1 egoNetworkconProfundidad: 2.
	
	self assert: set size equals: 10.
	self assert: (set includes: p2).
	self assert: (set includes: p12).
	self deny: (set includes: p15).
	self deny: (set includes: p10)
]

{ #category : #tests }
PersonaRedTest >> testInitializeConNombreApellidoEdad [ 	
	|roberto|
	roberto:= PersonaRed newConNombre: 'roberto' apellido: 'sco' edad: 22.
	self assert: roberto nombre equals: 'roberto'.
	self assert: roberto apellido equals: 'sco'. 
	self assert: roberto edad equals: 22. 
	
	
]
