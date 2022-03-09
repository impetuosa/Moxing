Class {
	#name : #MOProperty,
	#superclass : #MOAttribute,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOProperty >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitProperty: self
]
