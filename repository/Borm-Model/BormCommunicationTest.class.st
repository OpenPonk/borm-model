Class {
	#name : #BormCommunicationTest,
	#superclass : #BormTest,
	#category : 'Borm-Model-Tests'
}

{ #category : #tests }
BormCommunicationTest >> testAddDataFlow [
	emptyCommunication addDataFlow: emptyDataFlow.
	self assert: emptyCommunication dataFlows size equals: 1
]

{ #category : #tests }
BormCommunicationTest >> testAllEntities [
	self assert: emptyCommunication allEntities equals: (Set with: emptyCommunication entity)
]

{ #category : #tests }
BormCommunicationTest >> testAllEntities2 [
	emptyCommunication addDataFlow: emptyDataFlow.
	self
		assert: emptyCommunication allEntities
		equals: (Set with: emptyCommunication entity with: emptyDataFlow entity)
]

{ #category : #tests }
BormCommunicationTest >> testAllEntities3 [
	emptyCommunication constraint: emptyConstraint.
	self
		assert: emptyCommunication allEntities
		equals: (Set with: emptyCommunication entity with: emptyConstraint entity)
]

{ #category : #tests }
BormCommunicationTest >> testEmptyCommunication [
	self assert: emptyCommunication dataFlows isEmpty.
	self assert: emptyCommunication constraint equals: nil
]

{ #category : #tests }
BormCommunicationTest >> testRemoveAllDataFlows [
	emptyCommunication addDataFlow: emptyDataFlow.
	emptyCommunication removeAllDataFlows.
	self assert: emptyCommunication dataFlows isEmpty
]

{ #category : #tests }
BormCommunicationTest >> testRemoveDataFlow [
	emptyCommunication addDataFlow: emptyDataFlow.
	emptyCommunication removeDataFlow: emptyDataFlow.
	self assert: emptyCommunication dataFlows isEmpty
]
