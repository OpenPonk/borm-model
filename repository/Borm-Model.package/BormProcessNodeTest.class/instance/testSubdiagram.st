tests
testSubdiagram
	self deny: emptyNode isSubdiagramNode.
	emptyNode subdiagram: emptyDiagram.
	self assert: emptyNode isSubdiagramNode.
	self assert: emptyNode subdiagram equals: emptyDiagram.
	emptyNode subdiagram: nil.
	self deny: emptyNode isSubdiagramNode.
	self assert: emptyNode subdiagram equals: nil