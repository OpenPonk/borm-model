moving
moveParticipantsFrom: aSourceDiagram to: aTargetDiagram
	aTargetDiagram removeAll.
	"detach elements from old diagram without causing a cascade"
	aSourceDiagram elements do: [ :each | each announcer unsubscribe: aSourceDiagram ].
	aSourceDiagram elements do: [ :each | aTargetDiagram add: each ].
	aSourceDiagram elements removeAll