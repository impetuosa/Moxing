Class {
	#name : #MOModelResumeNextBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelResumeNextBuilder >> buildsType [

	^ MOAlceResumeNext
]

{ #category : #accessing }
MOModelResumeNextBuilder >> privateBuild [

	^ self instantiate: self buildsType
]
