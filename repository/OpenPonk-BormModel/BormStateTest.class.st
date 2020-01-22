Class {
	#name : #BormStateTest,
	#superclass : #BormProcessNodeTest,
	#category : #'OpenPonk-BormModel-Tests'
}

{ #category : #'testing - instance creation' }
BormStateTest >> emptyNode [
	^ emptyState
]

{ #category : #tests }
BormStateTest >> testAllEntities [
	self assert: emptyState allEntities equals: (Set with: emptyState entity)
]

{ #category : #tests }
BormStateTest >> testChangeState [
	self deny: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isInitial: true.
	self assert: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isInitial: false.
	self deny: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isFinal: true.
	self deny: emptyState isInitial.
	self assert: emptyState isFinal.

	emptyState isFinal: false.
	self deny: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isInitial: true.
	emptyState isFinal: true.
	self assert: emptyState isInitial.
	self assert: emptyState isFinal
]

{ #category : #tests }
BormStateTest >> testEmptyState [
	self deny: emptyState isInitial.
	self deny: emptyState isFinal
]
