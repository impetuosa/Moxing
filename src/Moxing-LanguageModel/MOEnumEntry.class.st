Class {
	#name : #MOEnumEntry,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'value'
	],
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

{ #category : #visiting }
MOEnumEntry >> value [

	^ value
]

{ #category : #visiting }
MOEnumEntry >> value: aValue [
 	 value := aValue 
]
