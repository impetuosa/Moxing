Class {
	#name : #MOModelGoToBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'labelReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelGoToBuilder >> labelReference [
	^ labelReference ifNil: [  self error:' Go To requires a reference ' ]
]

{ #category : #'as yet unclassified' }
MOModelGoToBuilder >> labelReference: aMOLabelReference [

	labelReference := aMOLabelReference
]

{ #category : #accessing }
MOModelGoToBuilder >> privateBuild [

	^ (self instantiate: MOAlceGoToLabel)
		  destination: self labelReference;
		  yourself
]
