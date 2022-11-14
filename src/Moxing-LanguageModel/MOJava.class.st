Class {
	#name : #MOJava,
	#superclass : #MOLanguage,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOJava >> astComposer [

	^ MoxingJavaAstComposer
	
]

{ #category : #accessing }
MOJava >> createFileReferenceWithin: aMOPackage for: aMODeclarationUnit relativeTo: aFileReference [

	| directory |
	self assert: aMOPackage isPackage.
	self assert: aMOPackage fileReference isNil.

	directory := ('.' split: aMOPackage name)
		             inject: aFileReference / #src / #main / #java
		             into: [ :acc :dir | (acc / dir) ensureCreateDirectory ].
	^ directory / (self sourceCodeFileNameFor: aMODeclarationUnit)
]

{ #category : #accessing }
MOJava >> export: aModel asDraftIntoDirectory: aFileReference [

	^ MOModelJavaExporter new
		  destinationDirectory: aFileReference;
		  export: aModel
]

{ #category : #accessing }
MOJava >> extension [
	 ^ 'java'
]

{ #category : #accessing }
MOJava >> isAbstract: aTypeOrMethod [

	^ aTypeOrMethod modifiers anySatisfy: [ :a | 
		  a asLowercase = #abstract ]
]

{ #category : #accessing }
MOJava >> isAbstractInvocable: aType [

	^ self isAbstract: aType
]

{ #category : #accessing }
MOJava >> isAbstractType: aType [

	^ self isAbstract: aType
]

{ #category : #accessing }
MOJava >> isJava [
	^ true
]

{ #category : #accessing }
MOJava >> link: aMOModelDerivative [

	^ MOModelLinker new link: aMOModelDerivative
]

{ #category : #accessing }
MOJava >> name [

	^ #Java
]

{ #category : #accessing }
MOJava >> newCodeTextWriter [

	^ MOJavaCodeGenerator new
]

{ #category : #accessing }
MOJava >> parser [

	^ JavaParser
]

{ #category : #accessing }
MOJava >> sourceCodeFileNameFor: aMODeclarationUnit [

	^ aMODeclarationUnit name capitalized , '.java'
]

{ #category : #accessing }
MOJava >> style [

	^ MOJavaStyle new
]
