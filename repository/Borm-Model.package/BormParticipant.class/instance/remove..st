removing
remove: aNode
	nodes remove: aNode.
	aNode removedFrom: self.
	self changed.
	self announce: (DCElementRemoved element: aNode)