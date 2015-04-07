accessing
constraint: aConstraint
	self hasConstraint
		ifTrue: [ ^ self ].
	constraint := aConstraint.
	aConstraint addedTo: self.
	self announceAdded: aConstraint