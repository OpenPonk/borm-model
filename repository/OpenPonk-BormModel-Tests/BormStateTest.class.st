"
I am a unit test class verifying the specific behavior of BORM states, extending node tests to check initial and final state toggles.
"
Class {
	#name : 'BormStateTest',
	#superclass : 'BormProcessNodeTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'testing - instance creation' }
BormStateTest >> emptyNode [
	^ emptyState
]

{ #category : 'tests' }
BormStateTest >> testBeInitialAndBeFinalSetFlagsAndAnnounceChange [

	| changeEvents |
	changeEvents := OrderedCollection new.
	emptyState when: OPModelChanged do: [ :event | changeEvents add: event ] for: self.
	[
		self assert: emptyState beInitial identicalTo: emptyState.
		self assert: emptyState isInitial description: 'beInitial must mark state as initial'.
		self assert: emptyState beFinal identicalTo: emptyState.
		self assert: emptyState isFinal description: 'beFinal must mark state as final'.
		self assert: changeEvents size equals: 2.
		self assert: changeEvents first model identicalTo: emptyState.
		self assert: changeEvents second model identicalTo: emptyState.

		emptyState isInitial: false.
		emptyState isFinal: false.
		self deny: emptyState isInitial description: 'State must allow resetting initial flag'.
		self deny: emptyState isFinal description: 'State must allow resetting final flag'.
		self assert: changeEvents size equals: 4 ] ensure: [ emptyState unsubscribe: self ]
]

{ #category : 'tests' }
BormStateTest >> testChangeState [

	self deny: emptyState isInitial description: 'New state must not start as initial'.
	self deny: emptyState isFinal description: 'New state must not start as final'.

	emptyState isInitial: true.
	self assert: emptyState isInitial description: 'State must report isInitial after setting true'.
	self deny: emptyState isFinal description: 'Setting isInitial must not change isFinal'.

	emptyState isInitial: false.
	self deny: emptyState isInitial description: 'State must report not initial after setting false'.
	self deny: emptyState isFinal description: 'Resetting isInitial must keep isFinal false'.

	emptyState isFinal: true.
	self deny: emptyState isInitial description: 'Setting isFinal must keep isInitial false'.
	self assert: emptyState isFinal description: 'State must report isFinal after setting true'.

	emptyState isFinal: false.
	self deny: emptyState isInitial description: 'Resetting isFinal must keep isInitial false'.
	self deny: emptyState isFinal description: 'State must report not final after setting false'.

	emptyState isInitial: true.
	emptyState isFinal: true.
	self assert: emptyState isInitial description: 'State can be simultaneously initial'.
	self assert: emptyState isFinal description: 'State can be simultaneously final'
]

{ #category : 'tests' }
BormStateTest >> testEmptyState [

	self deny: emptyState isInitial description: 'New state must not be initial by default'.
	self deny: emptyState isFinal description: 'New state must not be final by default'
]

{ #category : 'tests' }
BormStateTest >> testRemoveSelfAndSelfLoopClearsParticipantAndConstraint [

	| selfLoop |
	emptyParticipant add: emptyState.
	selfLoop := emptyState => emptyState.
	selfLoop constraint: emptyConstraint.

	self assert: emptyState remove identicalTo: emptyState.
	self assertEmpty: emptyParticipant nodes.
	self assert: emptyState owner identicalTo: nil.
	self assertEmpty: emptyState transitions.
	self assert: selfLoop owner identicalTo: nil.
	self assert: selfLoop constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil
]

{ #category : 'tests' }
BormStateTest >> testRemovedFromParticipantClearsTransitionsAndOwner [

	| otherParticipant transition |
	otherParticipant := self emptyParticipant.
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.
	transition := self transitionFrom: emptyState to: emptyActivity.
	transition constraint: emptyConstraint.

	self should: [ emptyState removedFrom: otherParticipant ] raise: AssertionFailure.

	emptyParticipant remove: emptyState.
	self deny: (emptyParticipant has: emptyState) description: 'Participant must no longer contain removed state'.
	self assert: emptyState owner identicalTo: nil.
	self assertEmpty: emptyState transitions.
	self assertEmpty: emptyActivity transitions.
	self assert: transition owner identicalTo: nil.
	self assert: transition constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil
]

{ #category : 'tests' }
BormStateTest >> testStatePredicates [

	self assert: emptyState isState description: 'BormState must report isState'.
	self deny: emptyState isActivity description: 'BormState must not report isActivity'.
	self assertEmpty: emptyState communications
]
