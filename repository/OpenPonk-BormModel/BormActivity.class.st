"
Activity represents some behavior in the model being executed when traversing from one state to another.

Activity can also communicate with activities in other participants using communications.
"
Class {
	#name : #BormActivity,
	#superclass : #BormProcessNode,
	#instVars : [
		'communications'
	],
	#category : #'OpenPonk-BormModel-Models'
}

{ #category : #'as yet unclassified' }
BormActivity >> ==> anActivity [
	^ BormFactory communicationFrom: self to: anActivity
]

{ #category : #accessing }
BormActivity >> allEntities [
	^ super allEntities , (self sent flatCollect: #allEntities)
]

{ #category : #accessing }
BormActivity >> communications [
	^ communications copy
]

{ #category : #'gt-inspector' }
BormActivity >> gtInspectorPresentation: composite [
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Transitions';
		display: [ transitions ].
	composite table
		title: 'Communications';
		display: [ communications ]
]

{ #category : #initialization }
BormActivity >> initialize [
	super initialize.
	communications := OrderedCollection new
]

{ #category : #accessing }
BormActivity >> isActivity [
	^ true
]

{ #category : #adding }
BormActivity >> receive: aCommunication [
	(communications includes: aCommunication)
		ifTrue: [ ^ self ].
	aCommunication receiver: self.
	communications add: aCommunication.
	self changed
]

{ #category : #accessing }
BormActivity >> received [
	^ communications select: [ :each | each receiver = self ]
]

{ #category : #removing }
BormActivity >> removeAllCommunications [
	communications copy
		do: [ :each | 
			each sender removeCommunication: each.
			each receiver removeCommunication: each ]
]

{ #category : #adding }
BormActivity >> removeCommunication: aCommunication [
	communications remove: aCommunication.
	aCommunication sender = self
		ifTrue: [ 
			aCommunication removedFrom: self.
			self announceRemoved: aCommunication ]
]

{ #category : #removing }
BormActivity >> removedFrom: aParticipant [
	super
		removedFrom: aParticipant
		do: [ 
			self removeAllTransitions.
			self removeAllCommunications ]
]

{ #category : #adding }
BormActivity >> send: aCommunication [
	(communications includes: aCommunication)
		ifTrue: [ ^ self ].
	aCommunication sender: self.
	communications add: aCommunication.
	aCommunication addedTo: self.
	self announceAdded: aCommunication
]

{ #category : #accessing }
BormActivity >> sent [
	^ communications select: [ :each | each sender = self ]
]
