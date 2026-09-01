"
I am the abstract base class for all elements in the BORM (Business Object Relation Modeling) metamodel. I manage an optional reference to a semantic conceptual entity that I represent.
"
Class {
	#name : 'BormElement',
	#superclass : 'OPModelObject',
	#instVars : [
		'entity'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'accessing' }
BormElement >> allEntities [
	^ Set with: self entity
]

{ #category : 'accessing' }
BormElement >> entity [
	^ entity
]

{ #category : 'accessing' }
BormElement >> entity: anEntity [
	entity := SRToOneLink
		on: self
		slot: #entity
		oppositeSlot: #representations
		updateFrom: entity
		to: anEntity
]

{ #category : 'initialization' }
BormElement >> initialize [
	super initialize.
	self entity: BormEntity new
]
