"
I represent a directed transition link between two BORM process nodes (states or activities). I define the process flow and can be governed by an associated constraint.
"
Class {
	#name : 'BormTransition',
	#superclass : 'BormElement',
	#traits : 'TBormRelationship',
	#classTraits : 'TBormRelationship classTrait',
	#instVars : [
		'constraint',
		'source',
		'target'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'accessing' }
BormTransition >> allEntities [
	^ (Set with: self entity)
		,
			(self hasConstraint
				ifTrue: [ self constraint allEntities ]
				ifFalse: [ {} ])
]

{ #category : 'accessing' }
BormTransition >> constraint [
	^ constraint
]

{ #category : 'accessing' }
BormTransition >> constraint: aConstraint [
	self hasConstraint
		ifTrue: [ ^ self ].
	constraint := aConstraint.
	aConstraint addedTo: self.
	self announceAdded: aConstraint
]

{ #category : 'accessing' }
BormTransition >> constraints [
	^ constraint ifNil: [ #() ] ifNotNil: [ ^ {constraint} ]
]

{ #category : 'accessing' }
BormTransition >> elements [

	self hasConstraint ifFalse: [ ^ #(  ) ].
	^ { self constraint }
]

{ #category : 'testing' }
BormTransition >> has: anEntity [
	^ constraint = anEntity
]

{ #category : 'testing' }
BormTransition >> hasConstraint [
	^ constraint isNotNil
]

{ #category : 'accessing' }
BormTransition >> removeConstraint [
	self hasConstraint
		ifFalse: [ ^ self ].
	constraint removedFrom: self.
	self announceRemovedChild: constraint.
	constraint := nil
]

{ #category : 'accessing' }
BormTransition >> source [
	^ source
]

{ #category : 'accessing' }
BormTransition >> source: aNode [
	source := aNode
]

{ #category : 'accessing' }
BormTransition >> target [
	^ target
]

{ #category : 'accessing' }
BormTransition >> target: aNode [
	target := aNode
]
