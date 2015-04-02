removing
removeAllNodes
	self nodes copy do: [ :each | self remove: each ]