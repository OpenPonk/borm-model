accessing
incoming
	^ transitions select: [ :each | each target = self ]