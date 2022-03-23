Class {
	#name : #MONoOp,
	#superclass : #MOExpression,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MONoOp >> acceptVisitor: aMOJavaCodeGenerator [

	^ aMOJavaCodeGenerator visitNoOp: self
]
