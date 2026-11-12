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
	self assert: emptyCommunication dataFlows size equals: 1
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
BormCommunicationTest >> testEmptyCommunication [

	self assertEmpty: emptyCommunication dataFlows.
	self assert: emptyCommunication constraint equals: nil
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
