"
Participant is statemachine-like diagram; it is composed of states and transitions between them.

The type of a participant can be specified with BormParticipantType and role with BormParticipantRole.
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

{ #category : 'as yet unclassified' }
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

{ #category : 'gt-inspector' }
BormParticipant >> inspectionNodes [

	<inspectorPresentationOrder: 30 title: 'Nodes'>
	^ SpTablePresenter new
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

{ #category : 'gt-spotter' }
BormParticipant >> spotterForCommunicationFor: aStep [
	<spotterOrder: 5>
	^ aStep listProcessor
		title: 'Incoming communications';
		allCandidates: [ (self nodes select: [ :each | each isKindOf: BormActivity ] thenCollect: [ :each | each received ]) flattened
 ]
]

{ #category : 'gt-spotter' }
BormParticipant >> spotterPreviewOn: aComposite [
	<spotterPreview: 5>
	
	^ aComposite table
		title: 'Details';
		display: [ { 
			'Name' -> self name.
			'Type' -> self type.
			'Role' -> self role.
			 } ];
		column: 'Detail' evaluated: #key;
		column: 'Value' evaluated: #value;
		entity: self
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
