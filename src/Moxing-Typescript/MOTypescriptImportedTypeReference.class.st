Class {
	#name : #MOTypescriptImportedTypeReference,
	#superclass : #MOTypescriptTypeReference,
	#instVars : [
		'definedAt'
	],
	#category : #'Moxing-Typescript-Model'
}

{ #category : #accessing }
MOTypescriptImportedTypeReference >> definedAt [
	^ definedAt
]

{ #category : #accessing }
MOTypescriptImportedTypeReference >> definedAt: aFileRef [
	definedAt := aFileRef
]

{ #category : #accessing }
MOTypescriptImportedTypeReference >> dependencies [
	^ {(MOTypescriptDependency new
		type: self;
		from: definedAt;
		yourself)}
]
