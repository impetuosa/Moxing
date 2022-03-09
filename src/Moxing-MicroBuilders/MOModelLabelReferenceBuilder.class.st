Class {
	#name : #MOModelLabelReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'label'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelLabelReferenceBuilder >> label [

	^ label ifNil: [ self error: 'Label name is compulsory ' ]
]

{ #category : #accessing }
MOModelLabelReferenceBuilder >> label: aString [ 
	label := aString
]

{ #category : #accessing }
MOModelLabelReferenceBuilder >> privateBuild [

	^ (self instantiate: MOAlceLabelReference)
		  name: self label;
		  yourself
]
