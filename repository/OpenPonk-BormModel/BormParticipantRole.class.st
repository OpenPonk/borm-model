"
I provide constant identifiers for the roles a participant can assume in a BORM model (e.g., `IsResponsible`, `Initiates`, `Cooperates`).
"
Class {
	#name : 'BormParticipantRole',
	#superclass : 'Object',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Acquires [
	^ #Acquires
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Approves [
	^ #Approves
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Consults [
	^ #Consults
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Cooperates [
	^ #Cooperates
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Initiates [
	^ #Initiates
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> IsInformed [
	^ #IsInformed
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> IsResponsible [
	^ #IsResponsible
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Performs [
	^ #Performs
]

{ #category : 'as yet unclassified' }
BormParticipantRole class >> Undefined [
	^ #Undefined
]
