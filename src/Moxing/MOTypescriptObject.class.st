Class {
	#name : #MOTypescriptObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'anchor'
	],
	#category : #'Moxing-ModelTS'
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

{ #category : #accessing }
MOTypescriptObject >> name [

	^ name
]

{ #category : #accessing }
MOTypescriptObject >> name: aName [

	name := aName
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
