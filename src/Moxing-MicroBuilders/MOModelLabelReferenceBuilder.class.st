Class {
	#name : #MOModelLabelReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'label'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelLabelReferenceBuilder >> buildsType [

	^ MOLabelReference 
]

{ #category : #accessing }
MOModelLabelReferenceBuilder >> label [

	^ label ifNil: [ self error: 'Label name is compulsory ' ]
]

{ #category : #accessing }
MOModelLabelReferenceBuilder >> label: aString [ 
	label := aString
]

{ #category : #accessing }
MOModelLabelReferenceBuilder >> loadBuilderWithEntity: anEntity [

	label := anEntity label
]

{ #category : #accessing }
MOModelLabelReferenceBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  label: self label;
		  yourself
]
