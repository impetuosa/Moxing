Class {
	#name : #MOTypescriptDecorator,
	#superclass : #MOTypescriptObject,
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
