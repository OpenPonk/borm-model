removing
removeTransition: aTransition
	transitions remove: aTransition.
	aTransition source = self
		ifTrue: [ 
			aTransition removedFrom: self.
			self announceRemoved: aTransition ]