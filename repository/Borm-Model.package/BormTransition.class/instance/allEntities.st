accessing
allEntities
	^ (Set with: self entity)
		,
			(self hasConstraint
				ifTrue: [ self constraint allEntities ]
				ifFalse: [ {} ])