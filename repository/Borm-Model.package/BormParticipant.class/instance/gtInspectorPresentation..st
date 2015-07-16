gt-inspector
gtInspectorPresentation: composite
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Nodes';
		display: [ self nodes ];
		column: 'Type'
			evaluated: [ :each | 
					each isState
						ifTrue: [ 'state' ]
						ifFalse: [ 'activity' ] ]
			width: 60;
		column: 'Name' evaluated: #name width: 100