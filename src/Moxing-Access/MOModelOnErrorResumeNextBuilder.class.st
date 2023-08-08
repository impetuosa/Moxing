Class {
	#name : #MOModelOnErrorResumeNextBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Access-MicroBuilder'
}

{ #category : #accessing }
MOModelOnErrorResumeNextBuilder >> privateBuild [

	^ (self instantiate: MOAlceOnErrorResumeNext )
		  yourself
]
