Class {
	#name : #MOModelResumeNextBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Access-MicroBuilder'
}

{ #category : #'as yet unclassified' }
MOModelResumeNextBuilder >> buildsType [

	^ MOAlceResumeNext
]

{ #category : #accessing }
MOModelResumeNextBuilder >> privateBuild [

	^ self instantiate: self buildsType
]
