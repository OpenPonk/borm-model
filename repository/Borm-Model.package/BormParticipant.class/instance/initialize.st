initialization
initialize
	super initialize.
	nodes := OrderedCollection new.
	type := self defaultType.
	role := self defaultRole