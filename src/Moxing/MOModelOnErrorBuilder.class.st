Class {
	#name : #MOModelOnErrorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'goTo'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelOnErrorBuilder >> goTo [
	^ goTo ifNil: [  self error: 'GoTo is compiulsorty ' ]
]

{ #category : #'as yet unclassified' }
MOModelOnErrorBuilder >> goTo: aMOLabelReference [

	goTo := aMOLabelReference
]

{ #category : #accessing }
MOModelOnErrorBuilder >> privateBuild [

	^ (self instantiate: MOAlceOnErrorGoToLabel)
		  destination: self goTo;
		  yourself
]
