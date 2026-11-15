"
I am a unit test class verifying the specific behavior of BORM activities, extending node tests to include communication channels and data exchanges.
"
Class {
	#name : 'BormActivityTest',
	#superclass : 'BormProcessNodeTest',
	#instVars : [
		'sender',
		'receiver',
		'communication'
	],
	#category : 'OpenPonk-BormModel-Tests-Models',
	#package : 'OpenPonk-BormModel-Tests',
	#tag : 'Models'
}

{ #category : 'testing - instance creation' }
BormActivityTest >> emptyNode [
	^ emptyActivity
]

{ #category : 'running' }
BormActivityTest >> setUp [
	super setUp.
	sender := BormActivity new.
	receiver := BormActivity new.
	communication := BormCommunication new.
	sender send: communication.
	receiver receive: communication
]

{ #category : 'tests' }
BormActivityTest >> testCommunication [

	self assert: communication sender identicalTo: sender.
	self assert: communication receiver identicalTo: receiver.
	self assert: communication owner identicalTo: sender.
	self assertCollection: sender sent hasSameElements: { communication }.
	self assertCollection: receiver received hasSameElements: { communication }
]

{ #category : 'tests' }
BormActivityTest >> testEmptyActivity [

	self assertEmpty: emptyActivity sent.
	self assertEmpty: emptyActivity received
]

{ #category : 'tests' }
BormActivityTest >> testRemoveAllCommunications [

	sender removeAllCommunications.
	self assertEmpty: sender sent.
	self assertEmpty: receiver received
]

{ #category : 'tests' }
BormActivityTest >> testRemoveAllCommunications2 [

	receiver removeAllCommunications.
	self assertEmpty: sender sent.
	self assertEmpty: receiver received
]

{ #category : 'tests' }
BormActivityTest >> testRemoveCommunication [

	self assertCollection: sender sent hasSameElements: { communication }.
	self assertCollection: receiver received hasSameElements: { communication }.
	sender removeCommunication: communication.
	receiver removeCommunication: communication.
	self assertEmpty: sender sent.
	self assertEmpty: receiver received
]
