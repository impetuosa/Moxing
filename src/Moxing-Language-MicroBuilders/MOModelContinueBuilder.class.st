Class {
	#name : #MOModelContinueBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Language-MicroBuilders-Statements'
}

{ #category : #asserting }
MOModelContinueBuilder >> buildsType [

	^ MOContinue
]

{ #category : #asserting }
MOModelContinueBuilder >> privateBuild [

	^ self instantiate: self buildsType
]
