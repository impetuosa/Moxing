Class {
	#name : #MOAngularTypeScript,
	#superclass : #MOTypeScript,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOAngularTypeScript >> sourceCodeFileNameFor: aMODeclarationUnit [

	aMODeclarationUnit parent isAngularComponent ifTrue: [ 
		(aMODeclarationUnit isKindOf: MOAngularCssDocument) ifTrue: [ 
			^ aMODeclarationUnit name asLowercase , '.component.css' ].
		(aMODeclarationUnit isKindOf: MOAngularTemplateDocument) ifTrue: [ 
			^ aMODeclarationUnit name asLowercase , '.component.html' ].
		^ aMODeclarationUnit name asLowercase , '.component.ts' ].

	^ super sourceCodeFileNameFor: aMODeclarationUnit
]
