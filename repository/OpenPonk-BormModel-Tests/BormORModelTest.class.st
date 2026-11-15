"
I am a unit test class verifying the behavior of BORM Object Relation models, ensuring correct participant management and entity retrieval at the root level.
"
Class {
	#name : 'BormORModelTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormORModelTest >> testAddAndRemoveParticipantEdgeCases [

	| addedEvents removedEvents otherParticipant returned |
	addedEvents := OrderedCollection new.
	removedEvents := OrderedCollection new.
	otherParticipant := self emptyParticipant.
	emptyModel when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	emptyModel when: OPModelChildRemoved do: [ :event | removedEvents add: event ] for: self.
	[
		emptyModel add: emptyParticipant.
		emptyModel add: emptyParticipant.
		self assertCollection: emptyModel participants hasSameElements: { emptyParticipant }.
		self assert: addedEvents size equals: 1.

		returned := emptyModel remove: otherParticipant.
		self assert: returned identicalTo: otherParticipant.
		self assertCollection: emptyModel participants hasSameElements: { emptyParticipant }.
		self assertEmpty: removedEvents ] ensure: [ emptyModel unsubscribe: self ]
]

{ #category : 'tests' }
BormORModelTest >> testAddParticipant [

	| addedEvents |
	addedEvents := OrderedCollection new.
	emptyModel when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	[
		emptyModel add: emptyParticipant.
		self assertCollection: emptyModel participants hasSameElements: { emptyParticipant }.
		self assert: emptyParticipant owner identicalTo: emptyModel.
		self assert: addedEvents size equals: 1.
		self assert: addedEvents first model identicalTo: emptyModel.
		self assert: addedEvents first child identicalTo: emptyParticipant ] ensure: [ emptyModel unsubscribe: self ]
]

{ #category : 'tests' }
BormORModelTest >> testAllEntities [
	self assert: emptyModel allEntities equals: (Set with: emptyModel entity)
]

{ #category : 'tests' }
BormORModelTest >> testAllEntities2 [
	emptyModel add: emptyParticipant.
	self
		assert: emptyModel allEntities
		equals: (Set with: emptyModel entity with: emptyParticipant entity)
]

{ #category : 'tests' }
BormORModelTest >> testEmpty [

	self assertEmpty: emptyModel participants
]

{ #category : 'tests' }
BormORModelTest >> testParticipantAndNodeLookupAndAtOperator [

	| node |
	emptyParticipant name: 'Customer'.
	node := emptyState name: 'Waiting'.
	emptyParticipant add: node.
	emptyModel add: emptyParticipant.

	self assert: (emptyModel participantNamed: 'Customer') identicalTo: emptyParticipant.
	self assert: emptyModel @ 'Customer' identicalTo: emptyParticipant.
	self assert: (emptyModel nodeNamed: 'Customer::Waiting') identicalTo: node.
	self assert: emptyModel @ 'Customer::Waiting' identicalTo: node.

	self should: [ emptyModel participantNamed: 'Missing' ] raise: NotFound.
	self should: [ emptyModel @ 'Missing' ] raise: NotFound.
	self should: [ emptyModel nodeNamed: 'Customer::Missing' ] raise: NotFound.
	self should: [ emptyModel @ 'Missing::Waiting' ] raise: NotFound
]

{ #category : 'tests' }
BormORModelTest >> testProjectAndStonInstVarNames [

	| project |
	self assert: emptyModel project identicalTo: nil.
	project := Object new.
	emptyModel project: project.
	self assert: emptyModel project identicalTo: project.
	self denyCollection: BormORModel stonAllInstVarNames includesAny: #( #project )
]

{ #category : 'tests' }
BormORModelTest >> testRemoveAll [

	emptyModel add: self fullParticipant.
	emptyModel removeAll.
	self assertEmpty: emptyModel participants
]

{ #category : 'tests' }
BormORModelTest >> testRemoveParticipant [

	| removedChildEvents participantRemovedEvents |
	removedChildEvents := OrderedCollection new.
	participantRemovedEvents := OrderedCollection new.
	emptyModel when: OPModelChildRemoved do: [ :event | removedChildEvents add: event ] for: self.
	emptyParticipant when: OPModelRemoved do: [ :event | participantRemovedEvents add: event ] for: self.
	[
		emptyModel add: emptyParticipant.
		emptyModel remove: emptyParticipant.
		self assertEmpty: emptyModel participants.
		self assert: emptyParticipant owner identicalTo: nil.
		self assert: removedChildEvents size equals: 1.
		self assert: removedChildEvents first model identicalTo: emptyModel.
		self assert: removedChildEvents first child identicalTo: emptyParticipant.
		self assert: participantRemovedEvents size equals: 1.
		self assert: participantRemovedEvents first model identicalTo: emptyModel ] ensure: [
			emptyModel unsubscribe: self.
			emptyParticipant unsubscribe: self ]
]
