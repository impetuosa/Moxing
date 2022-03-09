Class {
	#name : #MOGlobalVariable,
	#superclass : #MOAbstractVariable,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOGlobalVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitGlobalVariable: self
]
