"
I am a unit test class verifying the behavior of BORM transitions, focusing on source/target node connections and constraint assignments.
"
Class {
	#name : 'BormTransitionTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests',
	#package : 'OpenPonk-BormModel',
	#tag : 'Tests'
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
BormTransitionTest >> testEmptyConstraint [
	self assert: emptyTransition constraint equals: nil
]
