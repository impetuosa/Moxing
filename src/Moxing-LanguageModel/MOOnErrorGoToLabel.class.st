Class {
	#name : #MOOnErrorGoToLabel,
	#superclass : #MOGoToLabel,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOOnErrorGoToLabel >> acceptVisitor: aMOTransformationApplier [

	aMOTransformationApplier visitOnErrorGoToLabel: self
]
