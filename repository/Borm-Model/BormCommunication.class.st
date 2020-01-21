"
Communication is a channel between two activities. Activites can send data flows in both directions through this channel
"
Class {
	#name : #BormCommunication,
	#superclass : #BormElement,
	#traits : 'TBormRelationship',
	#classTraits : 'TBormRelationship classTrait',
	#instVars : [
		'constraint',
		'sender',
		'receiver'
	],
	#category : #'Borm-Model-Models'
}

{ #category : #adding }
BormCommunication >> addDataFlow: aDataFlow [
	^ self add: aDataFlow
]

{ #category : #adding }
BormCommunication >> addDataFlowNamed: aString [
	^ self add: (BormDataFlow named: aString)
]

{ #category : #accessing }
BormCommunication >> allEntities [
	^ (Set with: self entity) , (self dataFlows flatCollect: #allEntities)
		,
			(self hasConstraint
				ifTrue: [ self constraint allEntities ]
				ifFalse: [ {} ])
]

{ #category : #accessing }
BormCommunication >> constraint [
	^ constraint
]

{ #category : #accessing }
BormCommunication >> constraint: aConstraint [
	self hasConstraint
		ifTrue: [ ^ self ].
	constraint := aConstraint.
	aConstraint addedTo: self.
	self announceAdded: aConstraint
]

{ #category : #accessing }
BormCommunication >> dataFlows [
	^ self elements
]

{ #category : #testing }
BormCommunication >> hasConstraint [
	^ constraint isNotNil
]

{ #category : #accessing }
BormCommunication >> receiver [
	^ receiver
]

{ #category : #accessing }
BormCommunication >> receiver: anActivity [
	receiver := anActivity
]

{ #category : #removing }
BormCommunication >> removeAllDataFlows [
	^ self removeAll
]

{ #category : #removing }
BormCommunication >> removeConstraint [
	self hasConstraint
		ifFalse: [ ^ self ].
	constraint removedFrom: self.
	self announceRemoved: constraint.
	constraint := nil
]

{ #category : #removing }
BormCommunication >> removeDataFlow: aDataFlow [
	^ self remove: aDataFlow
]

{ #category : #accessing }
BormCommunication >> sender [
	^ sender
]

{ #category : #accessing }
BormCommunication >> sender: anActivity [
	sender := anActivity
]

{ #category : #accessing }
BormCommunication >> source [
	^ self sender
]

{ #category : #accessing }
BormCommunication >> source: aSource [
	self sender: aSource
]

{ #category : #accessing }
BormCommunication >> target [
	^ self receiver
]

{ #category : #accessing }
BormCommunication >> target: aSource [
	self receiver: aSource
]
