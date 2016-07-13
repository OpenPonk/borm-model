tests
testSubdiagram
	self deny: emptyNode isSubmodelNode.
	emptyNode submodel: emptyDiagram.
	self assert: emptyNode isSubmodelNode.
	self assert: emptyNode submodel equals: emptyDiagram.
	emptyNode submodel: nil.
	self deny: emptyNode isSubmodelNode.
	self assert: emptyNode submodel equals: nil