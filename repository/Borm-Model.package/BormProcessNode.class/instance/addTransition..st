adding
addTransition: aTransition
	(transitions includes: aTransition)
		ifTrue: [ ^ self ].
	transitions add: aTransition.
	aTransition source = self
		ifTrue: [ 
			aTransition addedTo: self.
			self announceAdded: aTransition ]
		ifFalse: [ self changed ]