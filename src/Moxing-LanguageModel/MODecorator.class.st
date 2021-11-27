Class {
	#name : #MODecorator,
	#superclass : #MOImportedTypeReference,
	#instVars : [
		'attributes'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MODecorator >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitDecoratorReference: self
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
