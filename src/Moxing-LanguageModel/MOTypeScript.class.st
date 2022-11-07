Class {
	#name : #MOTypeScript,
	#superclass : #MOLanguage,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOTypeScript >> astComposer [

	^ MoxingTypescriptAstComposer
]

{ #category : #accessing }
MOTypeScript >> extension [

	^ 'ts'
]

{ #category : #accessing }
MOTypeScript >> isAbstract: aTypeOrMethod [

	^ aTypeOrMethod modifiers anySatisfy: [ :a | 
		  a asLowercase = #abstract ]
]

{ #category : #accessing }
MOTypeScript >> isAbstractInvocable: aType [

	^ self isAbstract: aType
]

{ #category : #accessing }
MOTypeScript >> isAbstractType: aType [

	^ self isAbstract: aType
]

{ #category : #accessing }
MOTypeScript >> isTypescript [
	^ true
]

{ #category : #accessing }
MOTypeScript >> name [

	^ #Typescript
]

{ #category : #accessing }
MOTypeScript >> newCodeTextWriter [

	^ MOTypescriptCodeGenerator new
]

{ #category : #accessing }
MOTypeScript >> parser [

	^ TypeScriptParser
]

{ #category : #accessing }
MOTypeScript >> sourceCodeFileNameFor: aMODeclarationUnit [

	^ aMODeclarationUnit name asLowercase , '.ts'
]

{ #category : #accessing }
MOTypeScript >> style [

	^ MOTypescriptStyle new
]