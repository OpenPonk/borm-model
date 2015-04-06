adding
add: aNode
	(nodes includes: aNode)
		ifTrue: [ ^ self ].
	nodes add: aNode.
	aNode addedTo: self.
	self announceAdded: aNode