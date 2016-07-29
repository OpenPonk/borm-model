accessing
allEntities
	^ (Set with: self entity) , (self nodes flatCollect: #allEntities)