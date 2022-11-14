Class {
	#name : #MOModelOnErrorResumeNextBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelOnErrorResumeNextBuilder >> privateBuild [

	^ (self instantiate: MOAlceOnErrorResumeNext )
		  yourself
]
