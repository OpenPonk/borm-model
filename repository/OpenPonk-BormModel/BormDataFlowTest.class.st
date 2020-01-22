Class {
	#name : #BormDataFlowTest,
	#superclass : #BormTest,
	#category : #'OpenPonk-BormModel-Tests'
}

{ #category : #'as yet unclassified' }
BormDataFlowTest >> testAllEntities [
	self assert: emptyDataFlow allEntities equals: (Set with: emptyDataFlow entity)
]

{ #category : #'as yet unclassified' }
BormDataFlowTest >> testChangeDataFlowType [
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput.
	emptyDataFlow beOutput.
	self deny: emptyDataFlow isInput.
	self assert: emptyDataFlow isOutput.
	emptyDataFlow beInput.
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput
]

{ #category : #tests }
BormDataFlowTest >> testDefaultDataFlow [
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput
]
