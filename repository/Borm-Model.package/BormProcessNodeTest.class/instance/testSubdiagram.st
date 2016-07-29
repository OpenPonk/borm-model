tests
testSubdiagram
	self deny: emptyNode isSubmodelNode.
	emptyNode submodel: emptyModel.
	self assert: emptyNode isSubmodelNode.
	self assert: emptyNode submodel equals: emptyModel.
	emptyNode submodel: nil.
	self deny: emptyNode isSubmodelNode.
	self assert: emptyNode submodel equals: nil