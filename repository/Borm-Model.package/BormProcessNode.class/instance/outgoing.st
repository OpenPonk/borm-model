accessing
outgoing
	^ transitions select: [ :each | each source = self ]