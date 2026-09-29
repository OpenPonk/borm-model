"
I represent a data flow package exchanged through a BORM communication channel. I indicate whether the data is an input or an output from the perspective of the receiving activity.
"
Class {
	#name : 'BormDataFlow',
	#superclass : 'BormElement',
	#instVars : [
		'type'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'enumeration' }
BormDataFlow class >> inputType [
	^ #input
]

{ #category : 'enumeration' }
BormDataFlow class >> outputType [
	^ #output
]

{ #category : 'actions' }
BormDataFlow >> beInput [
	^ type := self class inputType
]

{ #category : 'actions' }
BormDataFlow >> beOutput [
	type := self class outputType
]

{ #category : 'initialization' }
BormDataFlow >> initialize [
	super initialize.
	self beInput
]

{ #category : 'testing' }
BormDataFlow >> isInput [
	^ type = self class inputType
]

{ #category : 'testing' }
BormDataFlow >> isOutput [
	^ type = self class outputType
]

{ #category : 'accessing' }
BormDataFlow >> type [
	^ type
]

{ #category : 'accessing' }
BormDataFlow >> type: aType [
	type := aType.
	self changed
]
