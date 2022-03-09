Class {
	#name : #MOModelLabelBuilder,
	#superclass : #MOModelLabelReferenceBuilder,
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelLabelBuilder >> privateBuild [

	^ (self instantiate: MOAlceLabel)
		  labelName: self label;
		  yourself
]
