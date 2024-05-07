Class {
	#name : 'BormORModelTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests',
	#package : 'OpenPonk-BormModel',
	#tag : 'Tests'
}

{ #category : 'tests' }
BormORModelTest >> testAddParticipant [

	emptyModel
		when: OPElementAdded
		do: [ :event | eventTriggered := true ]
		for: self.
	emptyModel add: emptyParticipant.
	self assert: emptyModel participants size equals: 1.
	self assert: emptyParticipant owner equals: emptyModel.
	self assert: eventTriggered
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
	self assert: emptyModel participants isEmpty
]

{ #category : 'tests' }
BormORModelTest >> testRemoveAll [
	emptyModel add: self fullParticipant.
	emptyModel removeAll.
	self assert: emptyModel participants size equals: 0
]

{ #category : 'tests' }
BormORModelTest >> testRemoveParticipant [

	emptyModel
		when: OPElementRemoved
		do: [ :event | eventTriggered := true ]
		for: self.
	emptyModel add: emptyParticipant.
	emptyModel remove: emptyParticipant.
	self assert: emptyModel participants size equals: 0.
	self assert: eventTriggered
]
