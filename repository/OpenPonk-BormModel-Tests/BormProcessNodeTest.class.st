"
I am an abstract unit test class verifying the common behavior of BORM process nodes, testing transition assignments, entity retrieval, and submodel linkages.
"
Class {
	#name : 'BormProcessNodeTest',
	#superclass : 'BormTest',
	#instVars : [
		'emptyNode'
	],
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'testing' }
BormProcessNodeTest class >> isAbstract [
	^ self = BormProcessNodeTest
]

{ #category : 'testing - instance creation' }
BormProcessNodeTest >> emptyNode [
	^ self subclassResponsibility
]

{ #category : 'running' }
BormProcessNodeTest >> setUp [
	super setUp.
	emptyNode := self emptyNode
]

{ #category : 'tests' }
BormProcessNodeTest >> testAddAndRemoveSelfLoopTransition [

	| selfLoop reverseSelfLoop |
	selfLoop := emptyNode => emptyNode.
	self assertCollection: emptyNode outgoing hasSameElements: { selfLoop }.
	self assertCollection: emptyNode incoming hasSameElements: { selfLoop }.
	self assertCollection: emptyNode transitions hasSameElements: { selfLoop }.
	self assert: selfLoop owner identicalTo: emptyNode.

	selfLoop constraint: emptyConstraint.
	emptyNode removeAllTransitions.
	self assertEmpty: emptyNode transitions.
	self assert: selfLoop owner identicalTo: nil.
	self assert: selfLoop constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil.

	reverseSelfLoop := self emptyTransition.
	reverseSelfLoop target: emptyNode.
	emptyNode addTransition: reverseSelfLoop.
	reverseSelfLoop source: emptyNode.
	emptyNode addTransition: reverseSelfLoop.
	self assert: reverseSelfLoop owner identicalTo: emptyNode.

	emptyNode removeAllTransitions.
	self assertEmpty: emptyNode transitions.
	self assert: reverseSelfLoop owner identicalTo: nil
]

{ #category : 'tests' }
BormProcessNodeTest >> testAddAndRemoveTransitionEdgeCases [

	| source target transition addedEvents removedEvents |
	source := emptyNode.
	target := emptyNode isState
		          ifTrue: [ emptyActivity ]
		          ifFalse: [ emptyState ].
	addedEvents := OrderedCollection new.
	removedEvents := OrderedCollection new.
	source when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	source when: OPModelChildRemoved do: [ :event | removedEvents add: event ] for: self.
	[
		transition := self transitionFrom: source to: target.
		source addTransition: transition.
		self assertCollection: source outgoing hasSameElements: { transition }.
		self assert: addedEvents size equals: 1.
		self assert: addedEvents first child identicalTo: transition.

		target removeTransition: transition.
		self assertEmpty: target incoming.
		self assert: transition owner identicalTo: source.
		self assertEmpty: removedEvents.

		source removeTransition: transition.
		self assertEmpty: source outgoing.
		self assert: transition owner identicalTo: nil.
		self assert: removedEvents size equals: 1.
		self assert: removedEvents first child identicalTo: transition.

		self should: [ source removeTransition: emptyTransition ] raise: NotFound ] ensure: [ source unsubscribe: self ]
]

{ #category : 'tests' }
BormProcessNodeTest >> testAddTransition [

	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	self assertCollection: source outgoing hasSameElements: { transition }.
	self assertCollection: target incoming hasSameElements: { transition }.
	self assert: transition owner identicalTo: source.
	self assert: transition source identicalTo: source.
	self assert: transition target identicalTo: target
]

{ #category : 'tests' }
BormProcessNodeTest >> testAllEntities [

	self assert: emptyNode allEntities equals: (Set with: emptyNode entity)
]

{ #category : 'tests' }
BormProcessNodeTest >> testAllEntitiesOutgoing [
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	self assert: source allEntities equals: (Set with: source entity with: transition entity).
	self assert: target allEntities equals: (Set with: target entity)
]

{ #category : 'tests' }
BormProcessNodeTest >> testDefaultAndCustomSimulationConditions [

	| anyCondition noneCondition |
	self assert: emptyNode inputTransitionSimulationCondition class identicalTo: BormNodeAllNeighborSimulationCondition.
	self assert: emptyNode inputCommunicationSimulationCondition class identicalTo: BormNodeAllNeighborSimulationCondition.
	self assert: emptyNode outputSimulationCondition class identicalTo: BormNodeAllNeighborSimulationCondition.

	anyCondition := BormNodeAnyNeighborSimulationCondition new.
	noneCondition := BormNodeNoneNeighborSimulationCondition new.
	emptyNode inputTransitionSimulationCondition: anyCondition.
	emptyNode inputCommunicationSimulationCondition: noneCondition.
	emptyNode outputSimulationCondition: anyCondition.

	self assert: emptyNode inputTransitionSimulationCondition identicalTo: anyCondition.
	self assert: emptyNode inputCommunicationSimulationCondition identicalTo: noneCondition.
	self assert: emptyNode outputSimulationCondition identicalTo: anyCondition
]

{ #category : 'tests' }
BormProcessNodeTest >> testEmptyProcessNode [

	self assertEmpty: emptyNode incoming.
	self assertEmpty: emptyNode outgoing.
	self assertEmpty: emptyNode transitions.
	self assert: emptyNode participant identicalTo: nil.
	self assert: emptyNode submodel identicalTo: nil.
	self deny: emptyNode isSubmodelNode description: 'Empty process node must not report as submodel node'
]

{ #category : 'tests' }
BormProcessNodeTest >> testInspectionTransitions [

	| otherNode outgoingTransition incomingTransition partialOutgoing partialIncoming table |
	emptyNode name: 'Current'.
	otherNode := (emptyNode isState
		              ifTrue: [ emptyActivity ]
		              ifFalse: [ emptyState ])
		             name: 'Neighbor';
		             yourself.
	outgoingTransition := emptyNode => otherNode.
	outgoingTransition name: 'out'.
	incomingTransition := otherNode => emptyNode.
	incomingTransition name: 'in'.
	partialOutgoing := self emptyTransition name: 'pendingOut'.
	partialOutgoing source: emptyNode.
	emptyNode addTransition: partialOutgoing.
	partialIncoming := self emptyTransition name: 'pendingIn'.
	partialIncoming target: emptyNode.
	emptyNode addTransition: partialIncoming.

	table := emptyNode inspectionTransitions: self newInspectorBuilder.
	self
		assert: (self inspectorRowsOf: table)
		equals: #( #( 'out' 'outgoing' 'Neighbor' ) #( 'in' 'incoming' 'Neighbor' ) #( 'pendingOut' 'outgoing' '' )
			   #( 'pendingIn' 'incoming' '' ) )
]

{ #category : 'tests' }
BormProcessNodeTest >> testParticipantAssociationTransitionsAndAllElements [

	| otherNode transition |
	otherNode := emptyNode isState
		             ifTrue: [ emptyActivity ]
		             ifFalse: [ emptyState ].
	emptyParticipant add: emptyNode.
	self assert: emptyNode participant identicalTo: emptyParticipant.

	transition := emptyNode => otherNode.
	transition constraint: emptyConstraint.
	self assert: (emptyNode has: transition) description: 'Source node must report having the created transition'.
	self assertCollection: emptyNode transitions hasSameElements: { transition }.
	self assertCollection: emptyNode allElements hasSameElements: {
			transition.
			emptyConstraint }
]

{ #category : 'tests' }
BormProcessNodeTest >> testRelatedElementsReturnsTransitionsCopy [

	| otherNode transition related |
	otherNode := emptyNode isState
		             ifTrue: [ emptyActivity ]
		             ifFalse: [ emptyState ].
	transition := emptyNode => otherNode.
	related := emptyNode relatedElements.
	self assertCollection: related hasSameElements: { transition }.
	related removeAll.
	self assertCollection: emptyNode transitions hasSameElements: { transition }
]

{ #category : 'tests' }
BormProcessNodeTest >> testRemoveAllTransitionsFromSource [

	| source target |
	source := emptyState.
	target := emptyActivity.
	self transitionFrom: source to: target.
	source removeAllTransitions.
	self assertEmpty: source outgoing.
	self assertEmpty: target incoming
]

{ #category : 'tests' }
BormProcessNodeTest >> testRemoveAllTransitionsFromTarget [

	| source target |
	source := emptyState.
	target := emptyActivity.
	self transitionFrom: source to: target.
	target removeAllTransitions.
	self assertEmpty: source outgoing.
	self assertEmpty: target incoming
]

{ #category : 'tests' }
BormProcessNodeTest >> testRemoveAllTransitionsWithPartialTransitionAndConstraint [

	| otherNode partialTransition sourceOnlyTransition |
	otherNode := emptyNode isState
		             ifTrue: [ emptyActivity ]
		             ifFalse: [ emptyState ].
	partialTransition := self emptyTransition.
	emptyNode addTransition: partialTransition.

	sourceOnlyTransition := self emptyTransition.
	sourceOnlyTransition from: emptyNode to: otherNode.
	sourceOnlyTransition constraint: emptyConstraint.
	emptyNode addTransition: sourceOnlyTransition.

	emptyNode removeAllTransitions.
	self assertEmpty: emptyNode transitions.
	self assertEmpty: otherNode transitions.
	self assert: partialTransition owner identicalTo: nil.
	self assert: sourceOnlyTransition owner identicalTo: nil.
	self assert: sourceOnlyTransition constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil
]

{ #category : 'tests' }
BormProcessNodeTest >> testRemoveTransition [

	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	source removeTransition: transition.
	target removeTransition: transition.
	self assertEmpty: source outgoing.
	self assertEmpty: target incoming
]

{ #category : 'tests' }
BormProcessNodeTest >> testSubdiagram [

	| changeEvents |
	changeEvents := OrderedCollection new.
	emptyNode when: OPModelChanged do: [ :event | changeEvents add: event ] for: self.
	[
		self deny: emptyNode isSubmodelNode description: 'Process node without submodel must not report as submodel node'.

		emptyNode submodel: emptyModel.
		self assert: emptyNode isSubmodelNode description: 'Process node with assigned submodel must report as submodel node'.
		self assert: emptyNode submodel identicalTo: emptyModel.
		self assert: changeEvents size equals: 1.
		self assert: changeEvents first model identicalTo: emptyNode.

		emptyNode submodel: nil.
		self deny: emptyNode isSubmodelNode description: 'Process node after clearing submodel must not report as submodel node'.
		self assert: emptyNode submodel identicalTo: nil.
		self assert: changeEvents size equals: 2 ] ensure: [ emptyNode unsubscribe: self ]
]
