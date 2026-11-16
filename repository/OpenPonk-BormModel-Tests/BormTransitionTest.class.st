"
I am a unit test class verifying the behavior of BORM transitions, focusing on source/target node connections and constraint assignments.
"
Class {
	#name : 'BormTransitionTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormTransitionTest >> testAllEntities [
	self assert: emptyTransition allEntities equals: (Set with: emptyTransition entity)
]

{ #category : 'tests' }
BormTransitionTest >> testAllEntities2 [
	emptyTransition constraint: emptyConstraint.
	self
		assert: emptyTransition allEntities
		equals: (Set with: emptyTransition entity with: emptyConstraint entity)
]

{ #category : 'tests' }
BormTransitionTest >> testConstraintAssignmentReplacementNilAndRemoval [

	| firstConstraint secondConstraint addedEvents removedEvents hasConstraintDuringRemoval |
	firstConstraint := self emptyConstraint name: 'first'.
	secondConstraint := self emptyConstraint name: 'second'.
	addedEvents := OrderedCollection new.
	removedEvents := OrderedCollection new.
	hasConstraintDuringRemoval := nil.
	emptyTransition when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	emptyTransition
		when: OPModelChildRemoved
		do: [ :event |
				hasConstraintDuringRemoval := emptyTransition hasConstraint.
				removedEvents add: event ]
		for: self.
	[
		emptyTransition constraint: nil.
		self assert: emptyTransition constraint identicalTo: nil.
		self assertEmpty: addedEvents.

		emptyTransition constraint: firstConstraint.
		emptyTransition constraint: firstConstraint.
		self assert: emptyTransition constraint identicalTo: firstConstraint.
		self assert: firstConstraint owner identicalTo: emptyTransition.
		self assert: addedEvents size equals: 1.

		emptyTransition constraint: secondConstraint.
		self assert: emptyTransition constraint identicalTo: secondConstraint.
		self assert: secondConstraint owner identicalTo: emptyTransition.
		self assert: firstConstraint owner identicalTo: nil.
		self assert: addedEvents size equals: 2.
		self assert: removedEvents size equals: 1.
		self assert: removedEvents first child identicalTo: firstConstraint.
		self deny: hasConstraintDuringRemoval description: 'Transition must clear constraint before announcing removal'.

		self assert: secondConstraint remove identicalTo: secondConstraint.
		self assert: emptyTransition constraint identicalTo: nil.
		self assert: secondConstraint owner identicalTo: nil.
		self assert: removedEvents size equals: 2.
		self assert: removedEvents second child identicalTo: secondConstraint.

		emptyTransition constraint: firstConstraint.
		emptyTransition constraint: nil.
		self assert: emptyTransition constraint identicalTo: nil.
		self assert: firstConstraint owner identicalTo: nil ] ensure: [ emptyTransition unsubscribe: self ]
]

{ #category : 'tests' }
BormTransitionTest >> testConstraints [

	self assertEmpty: emptyTransition constraints.
	emptyTransition constraint: emptyConstraint.
	self assertCollection: emptyTransition constraints hasSameElements: { emptyConstraint }.
	emptyTransition constraint: nil.
	self assertEmpty: emptyTransition constraints
]

{ #category : 'tests' }
BormTransitionTest >> testCreationFromToNamed [

	| createdTransition |
	createdTransition := BormTransition from: emptyState to: emptyActivity named: 'proceed'.
	self assert: createdTransition class identicalTo: BormTransition.
	self assert: createdTransition source identicalTo: emptyState.
	self assert: createdTransition target identicalTo: emptyActivity.
	self assert: createdTransition name equals: 'proceed'
]

{ #category : 'tests' }
BormTransitionTest >> testElementsAndAllElementsReflectConstraintPresence [

	self assertEmpty: emptyTransition elements.
	self assertEmpty: emptyTransition allElements.

	emptyTransition constraint: emptyConstraint.
	self assertCollection: emptyTransition elements hasSameElements: { emptyConstraint }.
	self assertCollection: emptyTransition allElements hasSameElements: { emptyConstraint }.

	emptyTransition constraint: nil.
	self assertEmpty: emptyTransition elements.
	self assertEmpty: emptyTransition allElements
]

{ #category : 'tests' }
BormTransitionTest >> testEmptyConstraint [

	self assert: emptyTransition constraint identicalTo: nil
]

{ #category : 'tests' }
BormTransitionTest >> testHasChecksConstraintAndRejectsNil [

	self deny: (emptyTransition has: nil) description: 'Transition without constraint must not report having nil'.
	self deny: (emptyTransition has: emptyConstraint) description: 'Empty transition must not report having unrelated constraint'.

	emptyTransition constraint: emptyConstraint.
	self assert: (emptyTransition has: emptyConstraint) description: 'Transition must report having assigned constraint'.
	self deny: (emptyTransition has: nil) description: 'Transition with constraint must not report having nil'
]

{ #category : 'tests' }
BormTransitionTest >> testRemoveDetachesFromEndpointsAndClearsConstraint [

	| transition selfLoop orphanTransition |
	transition := emptyState => emptyActivity.
	transition constraint: emptyConstraint.
	self assert: transition remove identicalTo: transition.
	self assertEmpty: emptyState transitions.
	self assertEmpty: emptyActivity transitions.
	self assert: transition owner identicalTo: nil.
	self assert: transition constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil.

	selfLoop := emptyState => emptyState.
	self assert: selfLoop remove identicalTo: selfLoop.
	self assertEmpty: emptyState transitions.
	self assert: selfLoop owner identicalTo: nil.

	orphanTransition := self emptyTransition.
	orphanTransition addedTo: emptyState.
	self assert: orphanTransition remove identicalTo: orphanTransition.
	self assert: orphanTransition owner identicalTo: nil
]
