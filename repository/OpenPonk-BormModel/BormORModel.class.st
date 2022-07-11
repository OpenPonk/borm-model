"
Diagram represents the topmost component of BORM model. It contains participants.
"
Class {
	#name : #BormORModel,
	#superclass : #BormElement,
	#instVars : [
		'project'
	],
	#category : #'OpenPonk-BormModel-Models'
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
BormORModel >> inspectionParticipants [

	<inspectorPresentationOrder: 30 title: 'Participants'>
	^ SpTablePresenter new
		  items: self participants;
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #name;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Type';
				   evaluated: #type;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Number of nodes';
				   evaluated: [ :each | each nodes size ];
				   yourself);
		  yourself
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
