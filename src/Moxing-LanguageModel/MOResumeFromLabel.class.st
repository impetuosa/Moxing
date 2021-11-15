Class {
	#name : #MOResumeFromLabel,
	#superclass : #MOGoToLabel,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOResumeFromLabel >> acceptVisitor: aMOTransformationApplier [

	aMOTransformationApplier visitResumeFromLabel: self
]
