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
		  language: (MOLanguage javaFor: aModel);
		  yourself
]

{ #category : #'instance creation' }
MOLanguageObject class >> newForTypescriptIn: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage typescriptFor: aModel);
		  yourself
]

{ #category : #'instance creation' }
MOLanguageObject class >> newMicrosoftAccessFor: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage microsoftAccessFor: aModel);
		  yourself
]

{ #category : #accessing }
MOLanguageObject >> acceptLanguageVisitor: aVisitor [

	| selector |
	selector := ('visit{1}{2}:' format: { 
			             self language name capitalized.
			             (self className copyFrom: 3 to: self className size) })
		            asSymbol.
	^ aVisitor perform: selector withArguments: { self }
]

{ #category : #accessing }
MOLanguageObject >> acceptVisitor: ads [

	self subclassResponsibility
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

{ #category : #accessing }
MOLanguageObject >> annotations: aCollection [ 
	annotations := aCollection
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> dependencies [
	^ {}
]

{ #category : #accessing }
MOLanguageObject >> language [
	^ language
]

{ #category : #accessing }
MOLanguageObject >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #generated }
MOLanguageObject >> produceCode [

	^ self language newCodeTextWriter produceCodeFor: self
]

{ #category : #generated }
MOLanguageObject >> sourceCode [

	^ anchor ifNotNil: [ anchor sourceCode ] ifNil: [ 
		  | gen |
		  gen := MOCodeGenerator new.
		  self acceptVisitor: gen.
		  gen sourceCode ]
]
