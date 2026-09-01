"
I represent a participant in a BORM model, acting as a state machine-like container composed of states, activities, and transitions. I define my specific participant type and organizational role.
"
Class {
	#name : 'BormParticipant',
	#superclass : 'BormElement',
	#instVars : [
		'type',
		'role'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'accessing' }
BormParticipant >> @ aName [
	^ self nodeNamed: aName
]

{ #category : 'accessing' }
BormParticipant >> allEntities [
	^ (Set with: self entity) , (self nodes flatCollect: #allEntities)
]

{ #category : 'updating' }
BormParticipant >> changed [
	super changed.
	owner changed
]

{ #category : 'defaults' }
BormParticipant >> defaultRole [
	^ BormParticipantRole Undefined
]

{ #category : 'defaults' }
BormParticipant >> defaultType [
	^ BormParticipantType Person
]

{ #category : 'initialization' }
BormParticipant >> initialize [
	super initialize.
	type := self defaultType.
	role := self defaultRole
]

{ #category : 'as yet unclassified' }
BormParticipant >> inspectionNodes: aBuilder [

	<inspectorPresentationOrder: 30 title: 'Nodes'>
	^ aBuilder newTable
		  items: self nodes;
		  addColumn: (SpStringTableColumn new
				   title: 'Type';
				   evaluated: [ :each |
						   each isState
							   ifTrue: [ 'state' ]
							   ifFalse: [ 'activity' ] ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #name;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
BormParticipant >> nodeNamed: aName [
	^ self elementNamed: aName
]

{ #category : 'accessing' }
BormParticipant >> nodes [
	^ self elements
]

{ #category : 'removing' }
BormParticipant >> removeAllNodes [
	self removeAll
]

{ #category : 'accessing' }
BormParticipant >> role [
	^ role
]

{ #category : 'accessing' }
BormParticipant >> role: aParticipantRole [
	role := aParticipantRole.
	self changed
]

{ #category : 'accessing' }
BormParticipant >> type [
	^ type
]

{ #category : 'accessing' }
BormParticipant >> type: aParticipantType [
	type := aParticipantType.
	self changed
]
