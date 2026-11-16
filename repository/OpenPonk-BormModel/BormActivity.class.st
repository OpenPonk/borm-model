"
I represent an activity within a BORM participant's process flow. I model executed behavior occurring between states and can engage in external communications with activities in other participants.
"
Class {
	#name : 'BormActivity',
	#superclass : 'BormProcessNode',
	#instVars : [
		'communications'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'associating' }
BormActivity >> ==> anActivity [
	^ BormFactory communicationFrom: self to: anActivity
]

{ #category : 'accessing' }
BormActivity >> allElements [
	"should return all elements recursively (incl. sub-elements)"

	^ super allElements
	  ,
	  (self communications flatCollect: [ :each | each withAllElements ])
]

{ #category : 'accessing' }
BormActivity >> allEntities [
	^ super allEntities , (self sent flatCollect: #allEntities)
]

{ #category : 'accessing' }
BormActivity >> communications [
	^ communications copy
]

{ #category : 'testing' }
BormActivity >> has: anElement [
	^ (super has: anElement) or: [ communications includes: anElement ]
]

{ #category : 'initialization' }
BormActivity >> initialize [
	super initialize.
	communications := OrderedCollection new
]

{ #category : 'inspecting' }
BormActivity >> inspectionCommunications: aBuilder [

	<inspectorPresentationOrder: 35 title: 'Communications'>
	^ aBuilder newTable
		  items: self communications;
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #name;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Direction';
				   evaluated: [ :communication |
						   communication source = self
							   ifTrue: [ 'sent' ]
							   ifFalse: [ 'received' ] ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Sender / Receiver';
				   evaluated: [ :communication |
						   (communication source = self
							    ifTrue: [ communication target ]
							    ifFalse: [ communication source ]) ifNil: [ '' ] ifNotNil: [ :endpoint | endpoint name ] ];
				   yourself);
		  yourself
]

{ #category : 'accessing' }
BormActivity >> isActivity [
	^ true
]

{ #category : 'adding' }
BormActivity >> receive: aCommunication [

	((communications includes: aCommunication) and: [ aCommunication receiver = self ]) ifTrue: [ ^ self ].
	aCommunication receiver: self.
	(communications includes: aCommunication) ifFalse: [ communications add: aCommunication ].
	self changed
]

{ #category : 'accessing' }
BormActivity >> received [
	^ communications select: [ :each | each receiver = self ]
]

{ #category : 'accessing' }
BormActivity >> relatedElements [

	^ super relatedElements , self communications
]

{ #category : 'removing' }
BormActivity >> removeAllCommunications [

	communications copy do: [ :each |
			each remove.
			(self has: each) ifTrue: [ self removeCommunication: each ] ]
]

{ #category : 'removing' }
BormActivity >> removeCommunication: aCommunication [

	communications remove: aCommunication.
	aCommunication sender = self ifFalse: [ ^ self ].
	aCommunication removedFrom: self.
	self announceRemovedChild: aCommunication
]

{ #category : 'adding' }
BormActivity >> send: aCommunication [

	((communications includes: aCommunication) and: [ aCommunication sender = self and: [ aCommunication owner = self ] ]) ifTrue: [
		^ self ].
	aCommunication sender: self.
	(communications includes: aCommunication) ifFalse: [ communications add: aCommunication ].
	aCommunication owner = self ifTrue: [ ^ self ].
	aCommunication addedTo: self.
	self announceAdded: aCommunication
]

{ #category : 'accessing' }
BormActivity >> sent [
	^ communications select: [ :each | each sender = self ]
]
