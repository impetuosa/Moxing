Class {
	#name : #MOModelOnErrorResumeNextBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelOnErrorResumeNextBuilder >> privateBuild [

	^ (self instantiate: MOAlceOnErrorResumeNext )
		  yourself
]
