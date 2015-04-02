adding
add: aNode
	nodes add: aNode.
	aNode addedTo: self.
	self announceAdded: aNode