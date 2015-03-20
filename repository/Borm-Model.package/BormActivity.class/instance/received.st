accessing
received
	^ communications select: [ :each | each receiver = self ]