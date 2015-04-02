removing
removedFrom: aParticipant
	super removedFrom: aParticipant do: [ self removeAllTransitions ]