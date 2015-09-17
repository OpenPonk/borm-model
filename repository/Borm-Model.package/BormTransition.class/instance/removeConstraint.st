accessing
removeConstraint
	self hasConstraint
		ifFalse: [ ^ self ].
	constraint removedFrom: self.
	self announceRemoved: constraint.
	constraint := nil