Class {
	#name : #MOModelOnErrorResumeNextBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelOnErrorResumeNextBuilder >> privateBuild [

	^ (self instantiate: MOAlceOnErrorResumeNext )
		  yourself
]
