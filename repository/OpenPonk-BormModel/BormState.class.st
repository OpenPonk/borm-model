"
I represent a distinct state of execution within a BORM participant. I track whether I am a regular, initial, or final state in the overall process lifecycle.
"
Class {
	#name : 'BormState',
	#superclass : 'BormProcessNode',
	#instVars : [
		'isInitial',
		'isFinal'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'actions' }
BormState >> beFinal [
	self isFinal: true
]

{ #category : 'actions' }
BormState >> beInitial [
	self isInitial: true
]

{ #category : 'initialization' }
BormState >> initialize [
	super initialize.
	isInitial := false.
	isFinal := false
]

{ #category : 'accessing' }
BormState >> isFinal [
	^ isFinal
]

{ #category : 'accessing' }
BormState >> isFinal: aBoolean [
	isFinal := aBoolean.
	self changed
]

{ #category : 'accessing' }
BormState >> isInitial [
	^ isInitial
]

{ #category : 'accessing' }
BormState >> isInitial: aBoolean [
	isInitial := aBoolean.
	self changed
]

{ #category : 'accessing' }
BormState >> isState [
	^ true
]

{ #category : 'removing' }
BormState >> removedFrom: aParticipant [
	super removedFrom: aParticipant do: [ self removeAllTransitions ]
]
