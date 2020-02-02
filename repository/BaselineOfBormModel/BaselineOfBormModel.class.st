Class {
	#name : #BaselineOfBormModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfBormModel
}

{ #category : #accessing }
BaselineOfBormModel >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
					with: [ spec repository: 'github://openponk/openponk-model/repository' ];
				baseline: 'SynchronizedLinks'
					with: [ spec repository: 'github://openponk/synchronized-links/repository' ].
			spec
				package: 'OpenPonk-BormModel'
				with: [ spec requires: #('OpenPonkModel' 'SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-BormModel') ]
]
