Class {
	#name : #MOImportedTypeReference,
	#superclass : #MOTypeReference,
	#instVars : [
		'#definedAt => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOImportedTypeReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitImportedTypeReference: self
]

{ #category : #accessing }
MOImportedTypeReference >> definedAt [
	^ definedAt
]

{ #category : #accessing }
MOImportedTypeReference >> definedAt: aFileRef [
	definedAt := aFileRef
]

{ #category : #accessing }
MOImportedTypeReference >> dependencies [
	^ {(MOImport new
		type: self;
		from: definedAt;
		yourself)}
]
