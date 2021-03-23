Class {
	#name : #RedNoReciprocaTest,
	#superclass : #TestCase,
	#instVars : [
		'david',
		'red',
		'marcos',
		'jose',
		'alberto',
		'paula',
		'martina',
		'violeta',
		'caro'
	],
	#category : #'Objetos1-RedSocial-Ejer21-Test'
}

{ #category : #running }
RedNoReciprocaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	david := PersonaRed newConNombre: 'david' apellido: 'sco' edad: 19.
	marcos := PersonaRed newConNombre: 'marcos' apellido: 'sco' edad: 15.
	jose := PersonaRed newConNombre: 'jose' apellido: 'sco' edad: 15.
	alberto := PersonaRed
		newConNombre: 'alberto:'
		apellido: 'sco'
		edad: 21.
	paula := PersonaRed newConNombre: 'paula' apellido: 'sco' edad: 5.
	martina := PersonaRed newConNombre: 'martina' apellido: 'sco' edad: 5.
	violeta := PersonaRed
		newConNombre: 'violeta'
		apellido: 'sco'
		edad: 19.
	caro := PersonaRed newConNombre: 'caro' apellido: 'sco' edad: 19.
	red := RedNoReciproca new.
	red
		agregarPersona: david;
		agregarPersona: marcos;
		agregarPersona: jose;
		agregarPersona: alberto;
		agregarPersona: paula;
		agregarPersona: martina;
		agregarPersona: violeta;
		agregarPersona: caro
]

{ #category : #tests }
RedNoReciprocaTest >> testAgregarPersona [
	| cant pe |
	cant := red personas size.
	pe:= PersonaRed newConNombre: 'pe' apellido: 'da' edad: 11.
	red agregarPersona: pe .
	self assert: (red personas includes: pe).
	self assert: red personas size equals: (cant + 1)
]

{ #category : #tests }
RedNoReciprocaTest >> testConectarPersonaCon [
	self deny: (david conoceA: marcos).
	self deny: (marcos conoceA: david).
	
	red conectarPersona: david con: marcos.
	
	self assert: (david conoceA: marcos).
 	self deny: (marcos conoceA: david).
]

{ #category : #tests }
RedNoReciprocaTest >> testEgoNetworkDeConProfundidad [
	| p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 set |
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
	
	set := red egoNetworkDe: p1 conProfundidad: 2.
	
	self assert: set size equals: 10.
	self assert: (set includes: p2).
	self assert: (set includes: p12).
	self deny: (set includes: p15).
	self deny: (set includes: p10).
]

{ #category : #tests }
RedNoReciprocaTest >> testHistogramaDeEdades [
	| histograma |

	histograma := red histogramaDeEdades.
	self assert: (histograma at: 19) equals: 3.
	self assert: (histograma at: 15) equals: 2.
	self assert: (histograma at: 21) equals: 1.
	self assert: (histograma at: 5) equals: 2
]

{ #category : #tests }
RedNoReciprocaTest >> testInDegree [
	self assert: (red inDegree: david) equals: 0.
	marcos conocerA: david.
	violeta conocerA: david .
		self assert: (red inDegree: david) equals: 2.
	
]

{ #category : #tests }
RedNoReciprocaTest >> testOutDegree [
	self assert: (red outDegree: david) equals: 0.
	david conocerA: marcos; conocerA: violeta .
		self assert: (red outDegree: david) equals: 2.
	
]
