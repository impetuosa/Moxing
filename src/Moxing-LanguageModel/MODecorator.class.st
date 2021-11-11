Class {
	#name : #MODecorator,
	#superclass : #MOImportedTypeReference,
	#instVars : [
		'attributes'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MODecorator >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitDecorator: self 
]

{ #category : #accessing }
MODecorator >> attributes [
	^ attributes ifNil: [  attributes := Dictionary new.  ]
]

{ #category : #accessing }
MODecorator >> attributes: someAttrs [ 
	^ attributes := someAttrs 
]

{ #category : #accessing }
MODecorator >> isDecorator [
	 ^ true 
]
