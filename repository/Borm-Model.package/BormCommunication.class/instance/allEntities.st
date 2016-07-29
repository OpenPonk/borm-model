accessing
allEntities
	^ (Set with: self entity) , (self dataFlows flatCollect: #allEntities)
		,
			(self hasConstraint
				ifTrue: [ self constraint allEntities ]
				ifFalse: [ {} ])