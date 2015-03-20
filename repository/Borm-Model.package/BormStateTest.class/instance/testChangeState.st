tests
testChangeState
	self deny: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isInitial: true.
	self assert: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isInitial: false.
	self deny: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isFinal: true.
	self deny: emptyState isInitial.
	self assert: emptyState isFinal.

	emptyState isFinal: false.
	self deny: emptyState isInitial.
	self deny: emptyState isFinal.

	emptyState isInitial: true.
	emptyState isFinal: true.
	self assert: emptyState isInitial.
	self assert: emptyState isFinal