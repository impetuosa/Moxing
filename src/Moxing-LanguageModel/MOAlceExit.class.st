Class {
	#name : #MOAlceExit,
	#superclass : #MOStatement,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOAlceExit >> acceptVisitor: aMOTransformationApplier [

	^ aMOTransformationApplier visitExit: self
]
