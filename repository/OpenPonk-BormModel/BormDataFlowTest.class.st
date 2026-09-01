"
I am a unit test class verifying the behavior of BORM data flows, specifically focusing on their input/output typings and entity associations.
"
Class {
	#name : 'BormDataFlowTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests',
	#package : 'OpenPonk-BormModel',
	#tag : 'Tests'
}

{ #category : 'tests' }
BormDataFlowTest >> testAllEntities [
	self assert: emptyDataFlow allEntities equals: (Set with: emptyDataFlow entity)
]

{ #category : 'tests' }
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

{ #category : 'tests' }
BormDataFlowTest >> testDefaultDataFlow [
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput
]
