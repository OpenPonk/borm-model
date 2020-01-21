Class {
	#name : #BormActivityTest,
	#superclass : #BormProcessNodeTest,
	#instVars : [
		'sender',
		'receiver',
		'communication'
	],
	#category : 'Borm-Model-Tests'
}

{ #category : #accessing }
BormActivityTest >> emptyNode [
	^ emptyActivity
]

{ #category : #running }
BormActivityTest >> setUp [
	super setUp.
	sender := BormActivity new.
	receiver := BormActivity new.
	communication := BormCommunication new.
	sender send: communication.
	receiver receive: communication
]

{ #category : #tests }
BormActivityTest >> testAllEntities [
	self assert: emptyActivity allEntities equals: (Set with: emptyActivity entity)
]

{ #category : #tests }
BormActivityTest >> testCommunication [
	self assert: communication sender equals: sender.
	self assert: communication receiver equals: receiver.
	self assert: communication owner equals: sender.
	self assert: sender sent size equals: 1.
	self assert: sender sent anyOne equals: communication.
	self assert: receiver received size equals: 1.
	self assert: receiver received anyOne equals: communication
]

{ #category : #tests }
BormActivityTest >> testEmptyActivity [
	self assert: emptyActivity sent isEmpty.
	self assert: emptyActivity received isEmpty
]

{ #category : #tests }
BormActivityTest >> testRemoveAllCommunications [
	sender removeAllCommunications.
	self assert: sender sent isEmpty.
	self assert: receiver received isEmpty
]

{ #category : #tests }
BormActivityTest >> testRemoveAllCommunications2 [
	receiver removeAllCommunications.
	self assert: sender sent isEmpty.
	self assert: receiver received isEmpty
]

{ #category : #tests }
BormActivityTest >> testRemoveCommunication [
	self assert: sender sent size equals: 1.
	self assert: receiver received size equals: 1.
	sender removeCommunication: communication.
	receiver removeCommunication: communication.
	self assert: sender sent isEmpty.
	self assert: receiver received isEmpty
]
