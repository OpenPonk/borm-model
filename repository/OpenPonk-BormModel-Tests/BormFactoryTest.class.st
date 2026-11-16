"
Tests covering factory helpers for creating transitions, FQN transitions, and communications between BORM elements.
"
Class {
	#name : 'BormFactoryTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Factory',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Factory'
}

{ #category : 'tests' }
BormFactoryTest >> testAddFqnTransitionsInParticipant [

	| finalState |
	finalState := self emptyState name: 'Done'.
	emptyState name: 'Waiting'.
	emptyActivity name: 'Order'.
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.
	emptyParticipant add: finalState.

	BormFactory
		addFqnTransitions: {
				('Waiting' -> 'Order').
				('Order' -> 'Done') }
		in: emptyParticipant.
	self assert: emptyState outgoing size equals: 1.
	self assert: emptyState outgoing first target identicalTo: emptyActivity.
	self assert: emptyActivity outgoing size equals: 1.
	self assert: emptyActivity outgoing first target identicalTo: finalState
]

{ #category : 'tests' }
BormFactoryTest >> testCommunicationFromToAttachesCommunicationToActivities [

	| receiverActivity communication |
	receiverActivity := self emptyActivity.
	communication := BormFactory communicationFrom: emptyActivity to: receiverActivity.
	self assert: communication class identicalTo: BormCommunication.
	self assert: communication sender identicalTo: emptyActivity.
	self assert: communication receiver identicalTo: receiverActivity.
	self assert: communication owner identicalTo: emptyActivity.
	self assertCollection: emptyActivity sent hasSameElements: { communication }.
	self assertCollection: receiverActivity received hasSameElements: { communication }
]

{ #category : 'tests' }
BormFactoryTest >> testFqnTransitionFromToInParticipant [

	| transition |
	emptyState name: 'Waiting'.
	emptyActivity name: 'Order'.
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.

	transition := BormFactory fqnTransitionFrom: 'Waiting' to: 'Order' in: emptyParticipant.
	self assert: transition source identicalTo: emptyState.
	self assert: transition target identicalTo: emptyActivity.
	self assertCollection: emptyState outgoing hasSameElements: { transition }.
	self should: [ BormFactory fqnTransitionFrom: 'Missing' to: 'Order' in: emptyParticipant ] raise: NotFound
]

{ #category : 'tests' }
BormFactoryTest >> testTransitionFromToAttachesTransitionToEndpoints [

	| transition |
	transition := BormFactory transitionFrom: emptyState to: emptyActivity.
	self assert: transition class identicalTo: BormTransition.
	self assert: transition source identicalTo: emptyState.
	self assert: transition target identicalTo: emptyActivity.
	self assert: transition owner identicalTo: emptyState.
	self assertCollection: emptyState outgoing hasSameElements: { transition }.
	self assertCollection: emptyActivity incoming hasSameElements: { transition }
]
