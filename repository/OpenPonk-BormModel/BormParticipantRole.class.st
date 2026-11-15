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

{ #category : 'constants' }
BormParticipantRole class >> Acquires [

	^ #Acquires
]

{ #category : 'constants' }
BormParticipantRole class >> Approves [

	^ #Approves
]

{ #category : 'constants' }
BormParticipantRole class >> Consults [

	^ #Consults
]

{ #category : 'constants' }
BormParticipantRole class >> Cooperates [

	^ #Cooperates
]

{ #category : 'constants' }
BormParticipantRole class >> Initiates [

	^ #Initiates
]

{ #category : 'constants' }
BormParticipantRole class >> IsInformed [

	^ #IsInformed
]

{ #category : 'constants' }
BormParticipantRole class >> IsResponsible [

	^ #IsResponsible
]

{ #category : 'constants' }
BormParticipantRole class >> Performs [

	^ #Performs
]

{ #category : 'constants' }
BormParticipantRole class >> Undefined [

	^ #Undefined
]
