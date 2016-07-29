accessing
allEntities
	^ (Set with: self entity) , (self outgoing flatCollect: #allEntities)