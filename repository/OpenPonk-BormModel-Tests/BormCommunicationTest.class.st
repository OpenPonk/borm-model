"
I am a unit test class verifying the behavior of BORM communications, including the addition, removal, and lifecycle management of contained data flows.
"
Class {
	#name : 'BormCommunicationTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormCommunicationTest >> testAddDataFlow [

	emptyCommunication addDataFlow: emptyDataFlow.
	self assertCollection: emptyCommunication dataFlows hasSameElements: { emptyDataFlow }.
	self assert: emptyDataFlow owner identicalTo: emptyCommunication
]

{ #category : 'tests' }
BormCommunicationTest >> testAllEntities [
	self assert: emptyCommunication allEntities equals: (Set with: emptyCommunication entity)
]

{ #category : 'tests' }
BormCommunicationTest >> testAllEntities2 [
	emptyCommunication addDataFlow: emptyDataFlow.
	self
		assert: emptyCommunication allEntities
		equals: (Set with: emptyCommunication entity with: emptyDataFlow entity)
]

{ #category : 'tests' }
BormCommunicationTest >> testAllEntities3 [
	emptyCommunication constraint: emptyConstraint.
	self
		assert: emptyCommunication allEntities
		equals: (Set with: emptyCommunication entity with: emptyConstraint entity)
]

{ #category : 'tests' }
BormCommunicationTest >> testConstraintAssignmentReplacementNilAndRemoval [

	| firstConstraint secondConstraint addedEvents removedEvents hasConstraintDuringRemoval |
	firstConstraint := self emptyConstraint name: 'first'.
	secondConstraint := self emptyConstraint name: 'second'.
	addedEvents := OrderedCollection new.
	removedEvents := OrderedCollection new.
	hasConstraintDuringRemoval := nil.
	emptyCommunication when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	emptyCommunication
		when: OPModelChildRemoved
		do: [ :event |
				hasConstraintDuringRemoval := emptyCommunication hasConstraint.
				removedEvents add: event ]
		for: self.
	[
		emptyCommunication constraint: nil.
		self assert: emptyCommunication constraint identicalTo: nil.
		self assertEmpty: addedEvents.

		emptyCommunication constraint: firstConstraint.
		emptyCommunication constraint: firstConstraint.
		self assert: emptyCommunication constraint identicalTo: firstConstraint.
		self assert: firstConstraint owner identicalTo: emptyCommunication.
		self assert: addedEvents size equals: 1.

		emptyCommunication constraint: secondConstraint.
		self assert: emptyCommunication constraint identicalTo: secondConstraint.
		self assert: secondConstraint owner identicalTo: emptyCommunication.
		self assert: firstConstraint owner identicalTo: nil.
		self assert: addedEvents size equals: 2.
		self assert: removedEvents size equals: 1.
		self assert: removedEvents first child identicalTo: firstConstraint.
		self deny: hasConstraintDuringRemoval description: 'Communication must clear constraint before announcing removal'.

		self assert: secondConstraint remove identicalTo: secondConstraint.
		self assert: emptyCommunication constraint identicalTo: nil.
		self assert: secondConstraint owner identicalTo: nil.
		self assert: removedEvents size equals: 2.
		self assert: removedEvents second child identicalTo: secondConstraint.

		emptyCommunication constraint: firstConstraint.
		emptyCommunication constraint: nil.
		self assert: emptyCommunication constraint identicalTo: nil.
		self assert: firstConstraint owner identicalTo: nil ] ensure: [ emptyCommunication unsubscribe: self ]
]

{ #category : 'tests' }
BormCommunicationTest >> testEmptyCommunication [

	self assertEmpty: emptyCommunication dataFlows.
	self assert: emptyCommunication constraint identicalTo: nil
]

{ #category : 'tests' }
BormCommunicationTest >> testRemoveAllDataFlows [

	emptyCommunication addDataFlow: emptyDataFlow.
	emptyCommunication removeAllDataFlows.
	self assertEmpty: emptyCommunication dataFlows
]

{ #category : 'tests' }
BormCommunicationTest >> testRemoveDataFlow [

	emptyCommunication addDataFlow: emptyDataFlow.
	emptyCommunication removeDataFlow: emptyDataFlow.
	self assertEmpty: emptyCommunication dataFlows
]

{ #category : 'tests' }
BormCommunicationTest >> testRemoveDetachesFromEndpointsAndClearsConstraintAndDataFlows [

	| receiverActivity communication selfLoop orphanCommunication |
	receiverActivity := self emptyActivity.
	communication := emptyActivity ==> receiverActivity.
	communication constraint: emptyConstraint.
	communication addDataFlow: emptyDataFlow.

	self assert: communication remove identicalTo: communication.
	self assertEmpty: emptyActivity communications.
	self assertEmpty: receiverActivity communications.
	self assert: communication owner identicalTo: nil.
	self assert: communication constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil.
	self assertEmpty: communication dataFlows.
	self assert: emptyDataFlow owner identicalTo: nil.

	selfLoop := emptyActivity ==> emptyActivity.
	self assert: selfLoop remove identicalTo: selfLoop.
	self assertEmpty: emptyActivity communications.
	self assert: selfLoop owner identicalTo: nil.

	orphanCommunication := self emptyCommunication.
	orphanCommunication addedTo: emptyActivity.
	self assert: orphanCommunication remove identicalTo: orphanCommunication.
	self assert: orphanCommunication owner identicalTo: nil
]
