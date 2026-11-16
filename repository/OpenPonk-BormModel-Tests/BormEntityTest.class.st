"
Tests covering entity naming fallback behavior and synchronized representation links in BORM models.
"
Class {
	#name : 'BormEntityTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormEntityTest >> testAddAndRemoveRepresentationSynchronizeOppositeEntity [

	| entity element previousEntity |
	entity := BormEntity new.
	element := self emptyState name: 'StateA'.
	previousEntity := element entity.
	self deny: previousEntity identicalTo: entity.

	self assert: (entity addRepresentation: element) identicalTo: entity.
	self assertCollection: entity representations hasSameElements: { element }.
	self assert: element entity identicalTo: entity.
	self assertEmpty: previousEntity representations.

	self assert: (entity removeRepresentation: element) identicalTo: entity.
	self assertEmpty: entity representations.
	self assert: element entity identicalTo: nil.
	self should: [ entity removeRepresentation: element ] raise: NotFound
]

{ #category : 'tests' }
BormEntityTest >> testEmptyEntityName [

	| entity |
	entity := BormEntity new.
	self assert: entity name equals: ''.
	self assertEmpty: entity representations
]

{ #category : 'tests' }
BormEntityTest >> testNameFallsBackToFirstRepresentationAndHandlesNilName [

	| entity firstRepresentation secondRepresentation |
	entity := BormEntity new.
	firstRepresentation := BormState new name: 'Waiting'.
	secondRepresentation := BormActivity new name: 'Process'.
	entity addRepresentation: firstRepresentation.
	self assert: entity name equals: 'Waiting'.

	entity addRepresentation: secondRepresentation.
	self assert: entity name equals: 'Waiting'.

	entity name: 'SharedConcept'.
	self assert: entity name equals: 'SharedConcept'.

	entity name: nil.
	self assert: entity name equals: 'Waiting'.

	entity removeRepresentation: firstRepresentation.
	self assert: entity name equals: 'Process'.

	entity removeRepresentation: secondRepresentation.
	self assert: entity name equals: ''
]
