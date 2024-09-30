Trait {
	#name : 'TBormRelationship',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'instance creation' }
TBormRelationship classSide >> from: aSourceObject to: aTargetObject [
	^ self new
		from: aSourceObject to: aTargetObject;
		yourself
]

{ #category : 'instance creation' }
TBormRelationship classSide >> from: aSourceObject to: aTargetObject named: aString [
	^ self new
		from: aSourceObject to: aTargetObject;
		name: aString;
		yourself
]

{ #category : 'instance creation' }
TBormRelationship >> from: aSource to: aTarget [
	self source: aSource.
	self target: aTarget
]
