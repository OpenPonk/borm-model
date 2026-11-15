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
BormActivityTest >> testAllElementsIncludesTransitionsCommunicationsAndChildren [

	| transition transitionConstraint communicationConstraint |
	transitionConstraint := self emptyConstraint.
	communicationConstraint := self emptyConstraint.
	transition := emptyActivity => emptyState.
	transition constraint: transitionConstraint.
	emptyActivity send: emptyCommunication.
	receiver receive: emptyCommunication.
	emptyCommunication constraint: communicationConstraint.
	emptyCommunication addDataFlow: emptyDataFlow.

	self assertCollection: emptyActivity allElements hasSameElements: {
			transition.
			transitionConstraint.
			emptyCommunication.
			communicationConstraint.
			emptyDataFlow }
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
BormActivityTest >> testParticipantRemovalClearsCommunicationsAcrossParticipants [

	| senderParticipant receiverParticipant senderActivity receiverActivity crossCommunication reverseCommunication |
	senderParticipant := self emptyParticipant.
	receiverParticipant := self emptyParticipant.
	senderActivity := self emptyActivity.
	receiverActivity := self emptyActivity.
	senderParticipant add: senderActivity.
	receiverParticipant add: receiverActivity.

	crossCommunication := senderActivity ==> receiverActivity.
	crossCommunication constraint: emptyConstraint.
	crossCommunication addDataFlow: emptyDataFlow.

	senderParticipant remove: senderActivity.
	self assertEmpty: senderParticipant nodes.
	self assert: senderActivity owner identicalTo: nil.
	self assertEmpty: senderActivity communications.
	self assertEmpty: receiverActivity communications.
	self assert: crossCommunication owner identicalTo: nil.
	self assert: crossCommunication constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil.
	self assertEmpty: crossCommunication dataFlows.
	self assert: emptyDataFlow owner identicalTo: nil.

	senderParticipant add: senderActivity.
	reverseCommunication := senderActivity ==> receiverActivity.
	self assert: receiverActivity remove identicalTo: receiverActivity.
	self assertEmpty: receiverParticipant nodes.
	self assertEmpty: senderActivity communications.
	self assertEmpty: receiverActivity communications.
	self assert: reverseCommunication owner identicalTo: nil
]

{ #category : 'tests' }
BormActivityTest >> testRelatedElementsIncludesTransitionsAndCommunications [

	| transition localCommunication |
	transition := emptyActivity => emptyState.
	localCommunication := emptyActivity ==> receiver.
	self assertCollection: emptyActivity relatedElements hasSameElements: {
			transition.
			localCommunication }
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
BormActivityTest >> testRemoveAllCommunicationsWithPartialCommunication [

	| partialCommunication |
	partialCommunication := self emptyCommunication.
	partialCommunication constraint: emptyConstraint.
	partialCommunication addDataFlow: emptyDataFlow.
	emptyActivity send: partialCommunication.
	partialCommunication sender: nil.

	emptyActivity removeAllCommunications.
	self assertEmpty: emptyActivity communications.
	self assert: partialCommunication owner identicalTo: nil.
	self assert: partialCommunication constraint identicalTo: nil.
	self assert: emptyConstraint owner identicalTo: nil.
	self assertEmpty: partialCommunication dataFlows.
	self assert: emptyDataFlow owner identicalTo: nil
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

{ #category : 'tests' }
BormActivityTest >> testSelfLoopCommunicationInBothOrders [

	| factoryLoop sendFirstLoop receiveFirstLoop addedEvents |
	addedEvents := OrderedCollection new.
	emptyActivity when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	[
		factoryLoop := BormFactory communicationFrom: emptyActivity to: emptyActivity.
		self assert: factoryLoop sender identicalTo: emptyActivity.
		self assert: factoryLoop receiver identicalTo: emptyActivity.
		self assert: factoryLoop owner identicalTo: emptyActivity.
		self assertCollection: emptyActivity sent hasSameElements: { factoryLoop }.
		self assertCollection: emptyActivity received hasSameElements: { factoryLoop }.
		self assertCollection: emptyActivity communications hasSameElements: { factoryLoop }.

		sendFirstLoop := self emptyCommunication.
		emptyActivity send: sendFirstLoop.
		emptyActivity send: sendFirstLoop.
		emptyActivity receive: sendFirstLoop.
		emptyActivity receive: sendFirstLoop.
		self assert: sendFirstLoop sender identicalTo: emptyActivity.
		self assert: sendFirstLoop receiver identicalTo: emptyActivity.
		self assert: sendFirstLoop owner identicalTo: emptyActivity.

		receiveFirstLoop := self emptyCommunication.
		emptyActivity receive: receiveFirstLoop.
		emptyActivity send: receiveFirstLoop.
		self assert: receiveFirstLoop sender identicalTo: emptyActivity.
		self assert: receiveFirstLoop receiver identicalTo: emptyActivity.
		self assert: receiveFirstLoop owner identicalTo: emptyActivity.

		self assert: addedEvents size equals: 3.
		self assertCollection: emptyActivity sent hasSameElements: {
				factoryLoop.
				sendFirstLoop.
				receiveFirstLoop }.
		self assertCollection: emptyActivity received hasSameElements: {
				factoryLoop.
				sendFirstLoop.
				receiveFirstLoop }.

		factoryLoop constraint: emptyConstraint.
		factoryLoop addDataFlow: emptyDataFlow.
		emptyActivity removeAllCommunications.
		self assertEmpty: emptyActivity communications.
		self assert: factoryLoop owner identicalTo: nil.
		self assert: factoryLoop constraint identicalTo: nil.
		self assert: emptyConstraint owner identicalTo: nil.
		self assertEmpty: factoryLoop dataFlows.
		self assert: emptyDataFlow owner identicalTo: nil.
		self assert: sendFirstLoop owner identicalTo: nil.
		self assert: receiveFirstLoop owner identicalTo: nil ] ensure: [ emptyActivity unsubscribe: self ]
]

{ #category : 'tests' }
BormActivityTest >> testSendWhenOwnerAlreadyMatchesDoesNotDuplicateAdditionAnnouncement [

	| addedEvents |
	addedEvents := OrderedCollection new.
	emptyActivity when: OPModelChildAdded do: [ :event | addedEvents add: event ] for: self.
	[
		emptyCommunication addedTo: emptyActivity.
		emptyActivity send: emptyCommunication.
		self assert: emptyCommunication sender identicalTo: emptyActivity.
		self assert: emptyCommunication owner identicalTo: emptyActivity.
		self assertCollection: emptyActivity sent hasSameElements: { emptyCommunication }.
		self assertEmpty: addedEvents.

		emptyCommunication sender: nil.
		emptyActivity send: emptyCommunication.
		self assert: emptyCommunication sender identicalTo: emptyActivity.
		self assertCollection: emptyActivity sent hasSameElements: { emptyCommunication }.
		self assertEmpty: addedEvents ] ensure: [ emptyActivity unsubscribe: self ]
]
