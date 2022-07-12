Class {
	#name : #MOModelGoToBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'labelReference'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelGoToBuilder >> buildsType [

	^ MOAlceGoToLabel
]

{ #category : #accessing }
MOModelGoToBuilder >> destination [
	^ labelReference ifNil: [  self error:' Go To requires a reference ' ]
]

{ #category : #'as yet unclassified' }
MOModelGoToBuilder >> destination: aMOLabelReference [

	labelReference := aMOLabelReference
]

{ #category : #accessing }
MOModelGoToBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  destination: self destination;
		  yourself
]
