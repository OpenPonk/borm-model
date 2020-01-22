Class {
	#name : #BormTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyParticipant',
		'emptyState',
		'emptyActivity',
		'emptyDataFlow',
		'emptyCommunication',
		'emptyTransition',
		'eventTriggered',
		'emptyConstraint',
		'emptyModel'
	],
	#category : #'OpenPonk-BormModel-Tests'
}

{ #category : #testing }
BormTest class >> isAbstract [
	^ self = BormTest
]

{ #category : #'testing - instance creation' }
BormTest >> emptyActivity [
	^ BormActivity new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyCommunication [
	^ BormCommunication new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyConstraint [
	^ BormConstraint new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyDataFlow [
	^ BormDataFlow new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyModel [
	^ BormORModel new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyParticipant [
	^ BormParticipant new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyState [
	^ BormState new
]

{ #category : #'testing - instance creation' }
BormTest >> emptyTransition [
	^ BormTransition new
]

{ #category : #'testing - instance creation' }
BormTest >> fullParticipant [
	| participant nodes |
	participant := self emptyParticipant.
	"initial -(a1)> mid -(a2)> final"
	participant
		add:
			(self emptyState
				name: 'initial';
				isInitial: true).
	participant add: (self emptyActivity name: 'a1').
	participant add: (self emptyState name: 'mid').
	participant add: (self emptyActivity name: 'a2').
	participant
		add:
			(self emptyState
				name: 'final';
				isFinal: true).
	nodes := participant nodes asOrderedCollection.
	self transitionsFrom: nodes first to: nodes third with: nodes second.
	self transitionsFrom: nodes third to: nodes fifth with: nodes fourth.
	^ participant
]

{ #category : #running }
BormTest >> setUp [
	emptyModel := self emptyModel.
	emptyParticipant := self emptyParticipant.
	emptyState := self emptyState.
	emptyActivity := self emptyActivity.
	emptyDataFlow := self emptyDataFlow.
	emptyCommunication := self emptyCommunication.
	emptyTransition := self emptyTransition.
	emptyConstraint := self emptyConstraint.
	eventTriggered := false
]

{ #category : #'testing - instance creation' }
BormTest >> transitionFrom: aSourceNode to: aTargetNode [
	| aTransition |
	(aTransition := self emptyTransition) from: aSourceNode to: aTargetNode.
	aSourceNode addTransition: aTransition.
	aTargetNode addTransition: aTransition.
	^ aTransition
]

{ #category : #'testing - instance creation' }
BormTest >> transitionsFrom: aSourceState to: aTargetState with: anActivity [
	^ Array
		with: (self transitionFrom: aSourceState to: anActivity)
		with: (self transitionFrom: anActivity to: aTargetState)
]
