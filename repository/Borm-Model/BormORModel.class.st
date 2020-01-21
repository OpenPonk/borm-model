"
Diagram represents the topmost component of BORM model. It contains participants.
"
Class {
	#name : #BormORModel,
	#superclass : #BormElement,
	#instVars : [
		'project'
	],
	#category : 'Borm-Model-Models'
}

{ #category : #'as yet unclassified' }
BormORModel class >> stonAllInstVarNames [
	^ super stonAllInstVarNames copyWithout: #project
]

{ #category : #accessing }
BormORModel >> @ aFqn [
	^ (aFqn includesSubstring: '::')
		ifTrue: [ self nodeNamed: aFqn ]
		ifFalse: [ self participantNamed: aFqn ]
]

{ #category : #accessing }
BormORModel >> allEntities [
	^ super allEntities , (self participants flatCollect: #allEntities)
]

{ #category : #'gt-inspector' }
BormORModel >> gtModelOn: aComposite [
	<gtInspectorPresentationOrder: 30>
	aComposite table
		title: 'Participants';
		display: [ self participants ];
		column: 'Name' evaluated: [ :each | each name ] width: 100;
		column: 'Type' evaluated: [ :each | each type ] width: 80;
		column: 'Number of nodes' evaluated: [ :each | each nodes size ]
]

{ #category : #accessing }
BormORModel >> nodeNamed: aString [
	| aName |
	aName := aString splitOn: '::'.
	^ (self participantNamed: aName first) @ aName second
]

{ #category : #accessing }
BormORModel >> participantNamed: aString [
	^ self elementNamed: aString
]

{ #category : #accessing }
BormORModel >> participants [
	^ self elements
]

{ #category : #accessing }
BormORModel >> project [
	^ project
]

{ #category : #accessing }
BormORModel >> project: aProject [
	project := aProject
]

{ #category : #'gt-spotter' }
BormORModel >> spotterForModelFor: aStep [
	<spotterOrder: 5>
	^ aStep listProcessor
		title: 'Borm Participants';
		allCandidates: [ self participants ];
		itemName: #name;
		filter: GTFilterSubstring
]
