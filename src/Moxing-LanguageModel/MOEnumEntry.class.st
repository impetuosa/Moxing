Class {
	#name : #MOEnumEntry,
	#superclass : #MOConstant,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOEnumEntry >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitEnumEntry: self
]
