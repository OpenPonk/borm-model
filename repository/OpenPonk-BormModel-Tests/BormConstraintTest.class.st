"
Tests covering removal semantics of attached and detached BORM constraints.
"
Class {
	#name : 'BormConstraintTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormConstraintTest >> testRemoveDetachedConstraintReturnsSelf [

	self assert: emptyConstraint owner identicalTo: nil.
	self assert: emptyConstraint remove identicalTo: emptyConstraint.
	self assert: emptyConstraint owner identicalTo: nil
]

{ #category : 'tests' }
BormConstraintTest >> testRemoveDetachesFromTransitionAndCommunication [

	emptyTransition constraint: emptyConstraint.
	self assert: emptyConstraint remove identicalTo: emptyConstraint.
	self assert: emptyTransition constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil.

	emptyCommunication constraint: emptyConstraint.
	self assert: emptyConstraint remove identicalTo: emptyConstraint.
	self assert: emptyCommunication constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil
]
