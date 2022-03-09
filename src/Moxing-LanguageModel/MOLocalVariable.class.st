Class {
	#name : #MOLocalVariable,
	#superclass : #MOAbstractVariable,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOLocalVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitLocalVariable: self
]
