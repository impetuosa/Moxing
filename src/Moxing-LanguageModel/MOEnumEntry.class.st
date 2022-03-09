Class {
	#name : #MOEnumEntry,
	#superclass : #MOGlobalConstant,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOEnumEntry >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitEnumEntry: self
]

{ #category : #visiting }
MOEnumEntry >> kindString [

	^ 'EnumEntry'
]
