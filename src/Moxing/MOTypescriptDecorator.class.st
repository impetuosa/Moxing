Class {
	#name : #MOTypescriptDecorator,
	#superclass : #MOTypescriptImportedTypeReference,
	#instVars : [
		'attributes'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #visiting }
MOTypescriptDecorator >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptDecorator: self 
]

{ #category : #accessing }
MOTypescriptDecorator >> attributes [
	^ attributes ifNil: [  attributes := Dictionary new.  ]
]

{ #category : #accessing }
MOTypescriptDecorator >> attributes: someAttrs [ 
	^ attributes := someAttrs 
]

{ #category : #accessing }
MOTypescriptDecorator >> isDecorator [
	 ^ true 
]
