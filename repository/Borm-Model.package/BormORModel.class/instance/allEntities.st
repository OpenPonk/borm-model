accessing
allEntities
	^ super allEntities , (self participants flatCollect: #allEntities)