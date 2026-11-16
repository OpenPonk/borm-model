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
BormParticipantTest >> testAllParticipantRoles [

	| roles |
	roles := {
		         BormParticipantRole Undefined.
		         BormParticipantRole Initiates.
		         BormParticipantRole Performs.
		         BormParticipantRole Cooperates.
		         BormParticipantRole Acquires.
		         BormParticipantRole Approves.
		         BormParticipantRole Consults.
		         BormParticipantRole IsInformed.
		         BormParticipantRole IsResponsible }.
	self assert: roles asSet size equals: 9.
	roles do: [ :eachRole |
			emptyParticipant role: eachRole.
			self assert: emptyParticipant role identicalTo: eachRole ]
]

{ #category : 'tests' }
BormParticipantTest >> testBigParticipant [

	| participant |
	participant := self fullParticipant.
	self assert: participant nodes size equals: 5.
	self assert: (participant @ 'initial') isInitial description: 'First node in fullParticipant must be initial'.
	self assert: (participant @ 'final') isFinal description: 'Last node in fullParticipant must be final'.
	self assert: (participant @ 'a1') outgoing size equals: 1.
	self assert: (participant @ 'a1') incoming size equals: 1
]

{ #category : 'tests' }
BormParticipantTest >> testChangeDoesNotDuplicateModelChangedAndHandlesMissingOwner [

	| modelEvents participantEvents |
	modelEvents := OrderedCollection new.
	participantEvents := OrderedCollection new.
	emptyParticipant changed.
	emptyParticipant role: BormParticipantRole Initiates.
	self assert: emptyParticipant role identicalTo: BormParticipantRole Initiates.

	emptyModel add: emptyParticipant.
	emptyModel when: OPModelChanged do: [ :event | modelEvents add: event ] for: self.
	emptyParticipant when: OPModelChanged do: [ :event | participantEvents add: event ] for: self.
	[
		emptyParticipant role: BormParticipantRole Performs.
		self assert: participantEvents size equals: 1.
		self assert: participantEvents first model identicalTo: emptyParticipant.
		self assert: modelEvents size equals: 1.
		self assert: modelEvents first model identicalTo: emptyModel ] ensure: [
			emptyModel unsubscribe: self.
			emptyParticipant unsubscribe: self ]
]

{ #category : 'tests' }
BormParticipantTest >> testChangeRole [

	emptyParticipant role: BormParticipantRole Cooperates.
	self assert: emptyParticipant role identicalTo: BormParticipantRole Cooperates
]

{ #category : 'tests' }
BormParticipantTest >> testChangeType [

	emptyParticipant type: BormParticipantType Organization.
	self assert: emptyParticipant type identicalTo: BormParticipantType Organization.
	emptyParticipant type: BormParticipantType System.
	self assert: emptyParticipant type identicalTo: BormParticipantType System.
	emptyParticipant type: BormParticipantType Person.
	self assert: emptyParticipant type identicalTo: BormParticipantType Person
]

{ #category : 'tests' }
BormParticipantTest >> testDefaultRole [

	self assert: emptyParticipant role identicalTo: BormParticipantRole Undefined
]

{ #category : 'tests' }
BormParticipantTest >> testDefaultType [

	self assert: emptyParticipant type identicalTo: BormParticipantType Person
]

{ #category : 'tests' }
BormParticipantTest >> testInspectionNodes [

	| table |
	emptyState name: 'Waiting'.
	emptyActivity name: 'Order'.
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.

	table := emptyParticipant inspectionNodes: self newInspectorBuilder.
	self assert: (self inspectorRowsOf: table) equals: #( #( 'state' 'Waiting' ) #( 'activity' 'Order' ) )
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
BormParticipantTest >> testRemoveAllNodesCleansUpTransitionsAndCrossParticipantCommunications [

	| otherParticipant otherActivity transition communication |
	otherParticipant := self emptyParticipant.
	otherActivity := self emptyActivity.
	otherParticipant add: otherActivity.
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.
	transition := emptyState => emptyActivity.
	communication := emptyActivity ==> otherActivity.
	communication constraint: emptyConstraint.

	emptyParticipant removeAllNodes.
	self assertEmpty: emptyParticipant nodes.
	self assertEmpty: emptyState transitions.
	self assertEmpty: emptyActivity transitions.
	self assertEmpty: emptyActivity communications.
	self assertEmpty: otherActivity communications.
	self assert: transition owner identicalTo: nil.
	self assert: communication owner identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil
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
