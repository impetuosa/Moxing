Class {
	#name : #MOTypescriptObject,
	#superclass : #MOObject,
	#category : #'Moxing-Typescript-Model'
}

{ #category : #'as yet unclassified' }
MOTypescriptObject >> anchorFrom: aJSDecoratorExpressionNode at: aFileReference [

	| start stop |
	start := aJSDecoratorExpressionNode startPosition.
	stop := aJSDecoratorExpressionNode stopPosition.

	anchor := MOAnchor new
		          start: start;
		          stop: stop;
		          file: aFileReference;
		          yourself
]

{ #category : #'as yet unclassified' }
MOTypescriptObject >> dependencies [
	^ {}
]

{ #category : #generated }
MOTypescriptObject >> sourceCode [

	^ anchor ifNotNil: [ anchor sourceCode ] ifNil: [ 
		  | gen |
		  gen := MOTypescriptCodeGenerator new.
		  self acceptVisitor: gen.
		  gen sourceCode ]
]

{ #category : #generated }
MOTypescriptObject >> type [
	^ self class name copyReplaceAll:'JinTypescript' with: ''
]
