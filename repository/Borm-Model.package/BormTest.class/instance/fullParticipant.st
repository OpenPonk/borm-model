testing - instance creation
fullParticipant
	| participant nodes |
	participant := self emptyParticipant.
	"initial -(a1)> mid -(a2)> final"
	participant
		add:
			(self emptyState
				name: 'initial';
				isInitial: true).
	participant add: (self emptyActivity name: 'a1').
	participant add: (self emptyState name: 'mid').
	participant add: (self emptyActivity name: 'a2').
	participant
		add:
			(self emptyState
				name: 'final';
				isFinal: true).
	nodes := participant nodes asOrderedCollection.
	self transitionsFrom: nodes first to: nodes third with: nodes second.
	self transitionsFrom: nodes third to: nodes fifth with: nodes fourth.
	^ participant