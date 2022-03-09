Class {
	#name : #MOConstantAttribute,
	#superclass : #MOAttribute,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOConstantAttribute >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitConstantAttribute: self
]

{ #category : #visiting }
MOConstantAttribute >> kindString [

	^ 'CONST ATTR'
]
