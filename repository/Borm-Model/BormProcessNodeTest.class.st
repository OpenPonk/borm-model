Class {
	#name : #BormProcessNodeTest,
	#superclass : #BormTest,
	#instVars : [
		'emptyNode'
	],
	#category : 'Borm-Model-Tests'
}

{ #category : #testing }
BormProcessNodeTest class >> isAbstract [
	^ self = BormProcessNodeTest
]

{ #category : #'testing - instance creation' }
BormProcessNodeTest >> emptyNode [
	^ self subclassResponsibility
]

{ #category : #running }
BormProcessNodeTest >> setUp [
	super setUp.
	emptyNode := self emptyNode
]

{ #category : #tests }
BormProcessNodeTest >> testAddTransition [
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	self assert: source outgoing size equals: 1.
	self assert: source outgoing anyOne equals: transition.
	self assert: target incoming size equals: 1.
	self assert: target incoming anyOne equals: transition.
	self assert: transition owner equals: source.
	self assert: transition source equals: source.
	self assert: transition target equals: target
]

{ #category : #tests }
BormProcessNodeTest >> testAllEntitiesOutgoing [
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	self assert: source allEntities equals: (Set with: source entity with: transition entity).
	self assert: target allEntities equals: (Set with: target entity)
]

{ #category : #tests }
BormProcessNodeTest >> testEmptyProcessNode [
	self assert: emptyNode incoming isEmpty.
	self assert: emptyNode outgoing isEmpty.
	self deny: emptyNode isSubmodelNode
]

{ #category : #tests }
BormProcessNodeTest >> testRemoveAllTransitionsFromSource [
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	source removeAllTransitions.
	self assert: source outgoing size equals: 0.
	self assert: target incoming size equals: 0
]

{ #category : #tests }
BormProcessNodeTest >> testRemoveAllTransitionsFromTarget [
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	target removeAllTransitions.
	self assert: source outgoing size equals: 0.
	self assert: target incoming size equals: 0
]

{ #category : #tests }
BormProcessNodeTest >> testRemoveTransition [
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	source removeTransition: transition.
	target removeTransition: transition.
	self assert: source outgoing size equals: 0.
	self assert: target incoming size equals: 0
]

{ #category : #tests }
BormProcessNodeTest >> testSubdiagram [
	self deny: emptyNode isSubmodelNode.
	emptyNode submodel: emptyModel.
	self assert: emptyNode isSubmodelNode.
	self assert: emptyNode submodel equals: emptyModel.
	emptyNode submodel: nil.
	self deny: emptyNode isSubmodelNode.
	self assert: emptyNode submodel equals: nil
]
