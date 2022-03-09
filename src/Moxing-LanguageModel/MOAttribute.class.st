Class {
	#name : #MOAttribute,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'visibility'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAttribute >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitAttribute: self
]

{ #category : #'as yet unclassified' }
MOAttribute >> kindString [

	^ 'ATTR'
]

{ #category : #'as yet unclassified' }
MOAttribute >> visibility [
	^ visibility
]

{ #category : #'as yet unclassified' }
MOAttribute >> visibility: aString [
	visibility := aString
]
