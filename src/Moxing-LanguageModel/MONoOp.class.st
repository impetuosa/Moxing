Class {
	#name : #MONoOp,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MONoOp >> acceptVisitor: aMOJavaCodeGenerator [ 
	aMOJavaCodeGenerator visitNoOp: self 
]
