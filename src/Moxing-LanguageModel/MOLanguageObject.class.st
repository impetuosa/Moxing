Class {
	#name : #MOLanguageObject,
	#superclass : #MOAnchoredObject,
	#instVars : [
		'language',
		'annotations'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'instance creation' }
MOLanguageObject class >> newForJavaIn: aModel [
	
	^ (aModel instantiate: self)
		  language: MOLanguage typescript;
		  yourself
]

{ #category : #'instance creation' }
MOLanguageObject class >> newForTypescriptIn: aModel [
	
	^ (aModel instantiate: self)
		  language: MOLanguage typescript;
		  yourself
]

{ #category : #adding }
MOLanguageObject >> addAnnotation: aMOAnnotation [ 
	self annotations add: aMOAnnotation
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> anchorFrom: aJSDecoratorExpressionNode at: aFileReference [

	| start stop |
	start := aJSDecoratorExpressionNode startPosition.
	stop := aJSDecoratorExpressionNode stopPosition.

	anchor := MOAnchor new
		          start: start;
		          stop: stop;
		          file: aFileReference;
		          yourself
]

{ #category : #generated }
MOLanguageObject >> annotations [
	^ annotations ifNil: [ annotations := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> dependencies [
	^ {}
]

{ #category : #accessing }
MOLanguageObject >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #generated }
MOLanguageObject >> sourceCode [

	^ anchor ifNotNil: [ anchor sourceCode ] ifNil: [ 
		  | gen |
		  gen := MOTypescriptCodeGenerator new.
		  self acceptVisitor: gen.
		  gen sourceCode ]
]
