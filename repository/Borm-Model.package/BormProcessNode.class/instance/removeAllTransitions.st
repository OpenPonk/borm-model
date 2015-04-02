removing
removeAllTransitions
	transitions copy
		do: [ :each | 
			each source removeTransition: each.
			each target removeTransition: each ]