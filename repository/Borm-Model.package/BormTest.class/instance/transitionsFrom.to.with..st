testing - instance creation
transitionsFrom: aSourceState to: aTargetState with: anActivity
	^ Array
		with: (self transitionFrom: aSourceState to: anActivity)
		with: (self transitionFrom: anActivity to: aTargetState)