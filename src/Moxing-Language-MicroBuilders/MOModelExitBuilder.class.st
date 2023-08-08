Class {
	#name : #MOModelExitBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #asserting }
MOModelExitBuilder >> buildsType [

	^ MOAlceExit
]

{ #category : #accessing }
MOModelExitBuilder >> loadBuilderWithEntity: anEntity [ 

]

{ #category : #asserting }
MOModelExitBuilder >> privateBuild [

	^ self instantiate: MOAlceExit
]
