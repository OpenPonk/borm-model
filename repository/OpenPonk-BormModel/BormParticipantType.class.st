"
I provide constant identifiers for the types of participants in a BORM model (e.g., `Person`, `Organization`, `System`).
"
Class {
	#name : 'BormParticipantType',
	#superclass : 'Object',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'constants' }
BormParticipantType class >> Organization [

	^ #Organization
]

{ #category : 'constants' }
BormParticipantType class >> Person [

	^ #Person
]

{ #category : 'constants' }
BormParticipantType class >> System [

	^ #System
]
