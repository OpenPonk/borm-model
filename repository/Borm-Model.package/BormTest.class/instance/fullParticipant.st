testing - instance creation
fullParticipant
	| participant |
	participant := self emptyParticipant.
	"initial -(a1)> mid -(a2)> final"
	participant
		add:
			(self emptyState
				name: 'initial';
				isInitial: true).
	participant add: self emptyActivity.
	participant add: (self emptyState name: 'mid').
	participant add: self emptyActivity.
	participant
		add:
			(self emptyState
				name: 'final';
				isFinal: true).
	self transitionsFrom: participant nodes first to: participant nodes third with: participant nodes second.
	self transitionsFrom: participant nodes third to: participant nodes fifth with: participant nodes fourth.
	^ participant