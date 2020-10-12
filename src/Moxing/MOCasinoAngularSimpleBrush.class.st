Class {
	#name : #MOCasinoAngularSimpleBrush,
	#superclass : #Object,
	#instVars : [
		'tag'
	],
	#category : #'Moxing-CodeWritingHtml'
}

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> bindingAttribute [
	self assert: self isInputBrush.
	^ '[(ngModule)]'
]

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> computeAttributesFor: aCSNElement [
	| extractor |
	extractor := MOAngularAttributesExtractor new.
	extractor forBrush: self. 
	aCSNElement attributes do: [ :a | a accept: extractor ].
	^ extractor result.
	
]

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> computeBodyFor: aCSNUIElement [

	| cowriter |
	cowriter := MOAngularHtmlBodyComplementsCoWriter new.
	cowriter brush: self.
	aCSNUIElement attributes do: [ :a | a accept: cowriter ]
]

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> isInputBrush [
	^ tag = 'input'
]

{ #category : #testing }
MOCasinoAngularSimpleBrush >> isParagraph [
	^ tag = 'p'
]

{ #category : #accessing }
MOCasinoAngularSimpleBrush >> tag: aString [ 
	tag := aString
]

{ #category : #writing }
MOCasinoAngularSimpleBrush >> write: aCSNUIParagraph into: aXMLWriter [
	^ aXMLWriter
		tag: tag
		attributes: (self computeAttributesFor: aCSNUIParagraph)
		with: [ self writeBodyComplementsFor: aCSNUIParagraph into: aXMLWriter ]
]

{ #category : #writing }
MOCasinoAngularSimpleBrush >> write: aCSNUIPanel into: aXMLWriter with: aFullBlockClosure [
	^ aXMLWriter tag: tag with: [ aFullBlockClosure value ]
]

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> writeBodyComplementsFor: aCSNUIElement into: aStream [
	| cowriter |
	cowriter := MOAngularHtmlBodyComplementsCoWriter new.
	cowriter brush: self stream: aStream.
	aCSNUIElement attributes do: [ :a | a accept: cowriter ]
]

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> writesBindingInAttribute [
	^ self isInputBrush
]

{ #category : #'as yet unclassified' }
MOCasinoAngularSimpleBrush >> writesBindingInBody [
	^ self isInputBrush not
]
