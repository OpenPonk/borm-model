Class {
	#name : #BormTransitionTest,
	#superclass : #BormTest,
	#category : #'OpenPonk-BormModel-Tests'
}

{ #category : #tests }
BormTransitionTest >> testAllEntities [
	self assert: emptyTransition allEntities equals: (Set with: emptyTransition entity)
]

{ #category : #tests }
BormTransitionTest >> testAllEntities2 [
	emptyTransition constraint: emptyConstraint.
	self
		assert: emptyTransition allEntities
		equals: (Set with: emptyTransition entity with: emptyConstraint entity)
]

{ #category : #tests }
BormTransitionTest >> testEmptyConstraint [
	self assert: emptyTransition constraint equals: nil
]
