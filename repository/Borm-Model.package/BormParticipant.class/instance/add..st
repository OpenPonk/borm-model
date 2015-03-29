adding
add: aNode
	nodes add: aNode.
	aNode addedTo: self.
	self announce: (DCElementAdded element: aNode).
	self changed