instance creation
addFqnTransitions: aCollection in: aParticipant
	aCollection do: [ :pair | self fqnTransitionFrom: pair key to: pair value in: aParticipant ]