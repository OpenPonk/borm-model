accessing
sent
	^ communications select: [ :each | each sender = self ]