Class {
	#name : #BormParticipantTest,
	#superclass : #BormTest,
	#category : #'OpenPonk-BormModel-Tests'
}

{ #category : #tests }
BormParticipantTest >> testAddNodes [
	self assert: emptyParticipant nodes size equals: 0.
	emptyParticipant add: emptyState.
	self assert: emptyParticipant nodes size equals: 1.
	self assert: (emptyParticipant nodes includes: emptyState).
	self assert: emptyState owner equals: emptyParticipant.
	emptyParticipant add: emptyActivity.
	self assert: emptyParticipant nodes size equals: 2.
	self assert: (emptyParticipant nodes includes: emptyActivity).
	self assert: emptyActivity owner equals: emptyParticipant
]

{ #category : #tests }
BormParticipantTest >> testAllEntities [
	self assert: emptyParticipant allEntities equals: {emptyParticipant entity} asSet
]

{ #category : #tests }
BormParticipantTest >> testAllEntities2 [
	emptyParticipant add: emptyState.
	self
		assert: emptyParticipant allEntities
		equals: (Set with: emptyParticipant entity with: emptyState entity)
]

{ #category : #tests }
BormParticipantTest >> testBigParticipant [
	| person |
	person := self fullParticipant.
	self assert: person nodes size equals: 5
]

{ #category : #tests }
BormParticipantTest >> testChangeRole [
	emptyParticipant role: BormParticipantRole Cooperates.
	self assert: emptyParticipant role equals: BormParticipantRole Cooperates
]

{ #category : #tests }
BormParticipantTest >> testChangeType [
	emptyParticipant type: BormParticipantType Organization.
	self assert: emptyParticipant type equals: BormParticipantType Organization.
	emptyParticipant type: BormParticipantType System.
	self assert: emptyParticipant type equals: BormParticipantType System.
	emptyParticipant type: BormParticipantType Person.
	self assert: emptyParticipant type equals: BormParticipantType Person
]

{ #category : #tests }
BormParticipantTest >> testDefaultRole [
	self assert: emptyParticipant role equals: BormParticipantRole Undefined
]

{ #category : #tests }
BormParticipantTest >> testDefaultType [
	self assert: emptyParticipant type equals: BormParticipantType Person
]

{ #category : #tests }
BormParticipantTest >> testRemoveAllNodes [
	| participant |
	participant := self fullParticipant.
	self assert: participant nodes size equals: 5.
	participant removeAllNodes.
	self assert: participant nodes isEmpty
]

{ #category : #tests }
BormParticipantTest >> testRemoveNodes [
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.
	self assert: emptyParticipant nodes size equals: 2.
	emptyParticipant remove: emptyState.
	self assert: emptyParticipant nodes size equals: 1.
	self assert: emptyState owner equals: nil.
	emptyParticipant remove: emptyActivity.
	self assert: emptyParticipant nodes size equals: 0.
	self assert: emptyActivity owner equals: nil
]
