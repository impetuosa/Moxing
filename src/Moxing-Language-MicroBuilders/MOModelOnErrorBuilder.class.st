Class {
	#name : #MOModelOnErrorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'goTo'
	],
	#category : #'Moxing-Language-MicroBuilders-Statements'
}

{ #category : #asserting }
MOModelOnErrorBuilder >> buildsType [

	^ MOAlceOnErrorGoToLabel
]

{ #category : #accessing }
MOModelOnErrorBuilder >> destination: aMOAlceLabelReference [ 
	goTo := aMOAlceLabelReference 
]

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
