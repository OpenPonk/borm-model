"
I am a unit test class verifying the behavior of BORM participants, including role/type configurations and the management of their internal process nodes.
"
Class {
	#name : 'BormParticipantTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormParticipantTest >> testAddNodes [

	self assertEmpty: emptyParticipant nodes.
	emptyParticipant add: emptyState.
	self assertCollection: emptyParticipant nodes hasSameElements: { emptyState }.
	self assert: emptyState owner identicalTo: emptyParticipant.
	emptyParticipant add: emptyActivity.
	self assertCollection: emptyParticipant nodes hasSameElements: {
			emptyState.
			emptyActivity }.
	self assert: emptyActivity owner identicalTo: emptyParticipant
]

{ #category : 'tests' }
BormParticipantTest >> testAllEntities [
	self assert: emptyParticipant allEntities equals: {emptyParticipant entity} asSet
]

{ #category : 'tests' }
BormParticipantTest >> testAllEntities2 [
	emptyParticipant add: emptyState.
	self
		assert: emptyParticipant allEntities
		equals: (Set with: emptyParticipant entity with: emptyState entity)
]

{ #category : 'tests' }
BormParticipantTest >> testBigParticipant [
	| person |
	person := self fullParticipant.
	self assert: person nodes size equals: 5
]

{ #category : 'tests' }
BormParticipantTest >> testChangeRole [
	emptyParticipant role: BormParticipantRole Cooperates.
	self assert: emptyParticipant role equals: BormParticipantRole Cooperates
]

{ #category : 'tests' }
BormParticipantTest >> testChangeType [
	emptyParticipant type: BormParticipantType Organization.
	self assert: emptyParticipant type equals: BormParticipantType Organization.
	emptyParticipant type: BormParticipantType System.
	self assert: emptyParticipant type equals: BormParticipantType System.
	emptyParticipant type: BormParticipantType Person.
	self assert: emptyParticipant type equals: BormParticipantType Person
]

{ #category : 'tests' }
BormParticipantTest >> testDefaultRole [
	self assert: emptyParticipant role equals: BormParticipantRole Undefined
]

{ #category : 'tests' }
BormParticipantTest >> testDefaultType [
	self assert: emptyParticipant type equals: BormParticipantType Person
]

{ #category : 'tests' }
BormParticipantTest >> testRemoveAllNodes [

	| participant |
	participant := self fullParticipant.
	self assert: participant nodes size equals: 5.
	participant removeAllNodes.
	self assertEmpty: participant nodes
]

{ #category : 'tests' }
BormParticipantTest >> testRemoveNodes [

	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.
	self assertCollection: emptyParticipant nodes hasSameElements: {
			emptyState.
			emptyActivity }.
	emptyParticipant remove: emptyState.
	self assertCollection: emptyParticipant nodes hasSameElements: { emptyActivity }.
	self assert: emptyState owner identicalTo: nil.
	emptyParticipant remove: emptyActivity.
	self assertEmpty: emptyParticipant nodes.
	self assert: emptyActivity owner identicalTo: nil
]
