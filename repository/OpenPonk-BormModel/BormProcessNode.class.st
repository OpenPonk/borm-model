"
Node is superclass of all nodes in a participant. They are connected with transitions.
"
Class {
	#name : 'BormProcessNode',
	#superclass : 'BormElement',
	#instVars : [
		'transitions',
		'submodel'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'associating' }
BormProcessNode >> => aNode [

	^ BormFactory transitionFrom: self to: aNode
]

{ #category : 'adding' }
BormProcessNode >> addTransition: aTransition [
	(transitions includes: aTransition)
		ifTrue: [ ^ self ].
	transitions add: aTransition.
	aTransition source = self
		ifTrue: [ 
			aTransition addedTo: self.
			self announceAdded: aTransition ]
		ifFalse: [ self changed ]
]

{ #category : 'accessing' }
BormProcessNode >> allElements [
	"should return all elements recursively (incl. sub-elements)"

	^ super allElements , (self transitions flatCollect: [ :each |
		   (Set with: each) , each allElements ])
]

{ #category : 'accessing' }
BormProcessNode >> allEntities [
	^ (Set with: self entity) , (self outgoing flatCollect: #allEntities)
]

{ #category : 'accessing' }
BormProcessNode >> has: anElement [
	^ transitions includes: anElement
]

{ #category : 'accessing' }
BormProcessNode >> incoming [
	^ transitions select: [ :each | each target = self ]
]

{ #category : 'initialization' }
BormProcessNode >> initialize [
	super initialize.
	transitions := OrderedCollection new
]

{ #category : 'inspection' }
BormProcessNode >> inspectionTransitions [

	<inspectorPresentationOrder: 30 title: 'Transitions'>
	^ SpTablePresenter new
		  items: self transitions;
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #name;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Direction';
				   evaluated: [ :transition | 
					   transition source = self
						   ifTrue: [ 'outgoing' ]
						   ifFalse: [ 'incoming' ] ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Source / Target';
				   evaluated: [ :transition | 
					   transition source = self
						   ifTrue: [ transition target name ]
						   ifFalse: [ transition source name ] ];
				   yourself);
		  yourself
]

{ #category : 'accessing' }
BormProcessNode >> isActivity [
	^ false
]

{ #category : 'accessing' }
BormProcessNode >> isState [
	^ false
]

{ #category : 'testing' }
BormProcessNode >> isSubmodelNode [
	^ submodel isNotNil
]

{ #category : 'accessing' }
BormProcessNode >> outgoing [
	^ transitions select: [ :each | each source = self ]
]

{ #category : 'accessing' }
BormProcessNode >> participant [

	^ self owner
]

{ #category : 'removing' }
BormProcessNode >> removeAllTransitions [
	transitions copy
		do: [ :each | 
			each source removeTransition: each.
			each target removeTransition: each ]
]

{ #category : 'removing' }
BormProcessNode >> removeTransition: aTransition [
	transitions remove: aTransition.
	aTransition source = self
		ifTrue: [ 
			aTransition removedFrom: self.
			self announceRemoved: aTransition ]
]

{ #category : 'removing' }
BormProcessNode >> removedFrom: aParticipant [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
BormProcessNode >> submodel [
	^ submodel
]

{ #category : 'accessing' }
BormProcessNode >> submodel: aModel [
	submodel := aModel.
	self changed
]

{ #category : 'accessing' }
BormProcessNode >> transitions [
	^ transitions
]
