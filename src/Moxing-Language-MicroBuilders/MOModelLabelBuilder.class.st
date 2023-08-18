Class {
	#name : #MOModelLabelBuilder,
	#superclass : #MOModelLabelReferenceBuilder,
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelLabelBuilder >> loadBuilderWithEntity: anEntity [

	label := anEntity name
]

{ #category : #accessing }
MOModelLabelBuilder >> privateBuild [

	^ (self instantiate: self buildsType )
		  label: self label;
		  yourself
]