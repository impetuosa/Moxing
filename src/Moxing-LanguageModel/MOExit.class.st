Class {
	#name : #MOExit,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOExit >> acceptVisitor: aMOTransformationApplier [

	aMOTransformationApplier visitExit: self
]