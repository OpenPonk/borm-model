*Borm-Model
spotterBormModelFor: aStep
"	<spotterOrder: -1>
	^ aStep listProcessor
			allCandidates: [ :x | BormDiagram allInstances ];
			itemName: #name;
			title: 'BORM Diagrams';
			itemIcon: [ BormEditorIcons current diagram16Icon ];
			filter: GTFilterSubstring;
			wantsToDisplayOnEmptyQuery: true"