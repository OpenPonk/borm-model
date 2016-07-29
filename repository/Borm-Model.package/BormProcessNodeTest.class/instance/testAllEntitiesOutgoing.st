tests
testAllEntitiesOutgoing
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	self assert: source allEntities equals: (Set with: source entity with: transition entity).
	self assert: target allEntities equals: (Set with: target entity)