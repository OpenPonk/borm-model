"
I am a unit test class verifying the behavior of BORM data flows, specifically focusing on their input/output typings and entity associations.
"
Class {
	#name : 'BormDataFlowTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormDataFlowTest >> testAllEntities [
	self assert: emptyDataFlow allEntities equals: (Set with: emptyDataFlow entity)
]

{ #category : 'tests' }
BormDataFlowTest >> testBeInputAndBeOutputReturnSelfAndAnnounceChange [

	| changeEvents returnedFlow |
	changeEvents := OrderedCollection new.
	emptyDataFlow when: OPModelChanged do: [ :event | changeEvents add: event ] for: self.
	[
		returnedFlow := emptyDataFlow beOutput.
		self assert: returnedFlow identicalTo: emptyDataFlow.
		self assert: emptyDataFlow isOutput description: 'beOutput must switch data flow to output'.
		self assert: changeEvents size equals: 1.
		self assert: changeEvents first model identicalTo: emptyDataFlow.

		returnedFlow := emptyDataFlow beInput.
		self assert: returnedFlow identicalTo: emptyDataFlow.
		self assert: emptyDataFlow isInput description: 'beInput must switch data flow to input'.
		self assert: changeEvents size equals: 2.
		self assert: changeEvents second model identicalTo: emptyDataFlow ] ensure: [ emptyDataFlow unsubscribe: self ].

	returnedFlow := self emptyDataFlow
		                name: 'Order';
		                beInput.
	emptyCommunication addDataFlow: returnedFlow.
	self assertCollection: emptyCommunication dataFlows hasSameElements: { returnedFlow }
]

{ #category : 'tests' }
BormDataFlowTest >> testChangeDataFlowType [

	self assert: emptyDataFlow isInput description: 'New data flow must start as input'.
	self deny: emptyDataFlow isOutput description: 'New data flow must not start as output'.

	emptyDataFlow beOutput.
	self deny: emptyDataFlow isInput description: 'Output data flow must not report isInput'.
	self assert: emptyDataFlow isOutput description: 'Data flow after beOutput must report isOutput'.
	self assert: emptyDataFlow type identicalTo: BormDataFlow outputType.

	emptyDataFlow beInput.
	self assert: emptyDataFlow isInput description: 'Data flow after beInput must report isInput'.
	self deny: emptyDataFlow isOutput description: 'Input data flow must not report isOutput'.
	self assert: emptyDataFlow type identicalTo: BormDataFlow inputType
]

{ #category : 'tests' }
BormDataFlowTest >> testDefaultDataFlow [

	self assert: emptyDataFlow isInput description: 'Default data flow must be an input'.
	self deny: emptyDataFlow isOutput description: 'Default data flow must not be an output'.
	self assert: emptyDataFlow type identicalTo: BormDataFlow inputType
]

{ #category : 'tests' }
BormDataFlowTest >> testTypeAccessorAndChangeAnnouncement [

	| changeEvents namedFlow |
	changeEvents := OrderedCollection new.
	emptyDataFlow when: OPModelChanged do: [ :event | changeEvents add: event ] for: self.
	[
		emptyDataFlow type: BormDataFlow outputType.
		self assert: emptyDataFlow isOutput description: 'Data flow assigned outputType must report isOutput'.
		self assert: changeEvents size equals: 1.
		self assert: changeEvents first model identicalTo: emptyDataFlow.

		emptyDataFlow type: BormDataFlow inputType.
		self assert: emptyDataFlow isInput description: 'Data flow assigned inputType must report isInput'.
		self assert: changeEvents size equals: 2 ] ensure: [ emptyDataFlow unsubscribe: self ].

	namedFlow := BormDataFlow named: 'Order'.
	self assert: namedFlow name equals: 'Order'.
	self assert: namedFlow isInput description: 'Named data flow must default to input'
]

{ #category : 'tests' }
BormDataFlowTest >> testUnknownAndNilTypeBoundaryValues [

	emptyDataFlow type: #custom.
	self assert: emptyDataFlow type identicalTo: #custom.
	self deny: emptyDataFlow isInput description: 'Custom data flow type must not report isInput'.
	self deny: emptyDataFlow isOutput description: 'Custom data flow type must not report isOutput'.

	emptyDataFlow type: nil.
	self assert: emptyDataFlow type identicalTo: nil.
	self deny: emptyDataFlow isInput description: 'Nil data flow type must not report isInput'.
	self deny: emptyDataFlow isOutput description: 'Nil data flow type must not report isOutput'
]
