adding
addTransition: aTransition
	transitions add: aTransition.
	aTransition source = self
		ifTrue: [ 
			aTransition addedTo: self.
			self announceAdded: aTransition ]
		ifFalse: [ self changed ]