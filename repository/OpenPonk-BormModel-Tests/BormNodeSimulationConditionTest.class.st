"
Tests covering value equality, hashing, and display labels of node simulation condition strategies.
"
Class {
	#name : 'BormNodeSimulationConditionTest',
	#superclass : 'BormTest',
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
BormNodeSimulationConditionTest >> testConditionNamesAsInputAndOutput [

	| allCondition anyCondition noneCondition |
	allCondition := BormNodeAllNeighborSimulationCondition new.
	anyCondition := BormNodeAnyNeighborSimulationCondition new.
	noneCondition := BormNodeNoneNeighborSimulationCondition new.

	self assert: allCondition nameAsOutput equals: 'All'.
	self assert: allCondition nameAsInput equals: 'All'.
	self assert: anyCondition nameAsOutput equals: 'Any'.
	self assert: anyCondition nameAsInput equals: 'Any'.
	self assert: noneCondition nameAsOutput equals: 'None'.
	self assert: noneCondition nameAsInput equals: 'None'.

	self should: [ BormNodeSimulationCondition new nameAsOutput ] raise: SubclassResponsibility.
	self should: [ BormNodeSimulationCondition new nameAsInput ] raise: SubclassResponsibility
]

{ #category : 'tests' }
BormNodeSimulationConditionTest >> testEqualityAndHash [

	| allFirst allSecond anyCondition noneCondition conditionSet |
	allFirst := BormNodeAllNeighborSimulationCondition new.
	allSecond := BormNodeAllNeighborSimulationCondition new.
	anyCondition := BormNodeAnyNeighborSimulationCondition new.
	noneCondition := BormNodeNoneNeighborSimulationCondition new.

	self assert: allFirst equals: allSecond.
	self assert: allFirst hash equals: allSecond hash.
	self deny: allFirst equals: anyCondition.
	self deny: anyCondition equals: noneCondition.
	self deny: allFirst equals: Object new.

	conditionSet := Set with: allFirst with: anyCondition with: noneCondition.
	conditionSet add: allSecond.
	self assert: conditionSet size equals: 3.
	self assert: (conditionSet includes: allSecond) description: 'Set must recognize equal condition instance by hash and equality'
]
