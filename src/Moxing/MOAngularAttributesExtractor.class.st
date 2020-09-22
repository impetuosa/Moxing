Class {
	#name : #MOAngularAttributesExtractor,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #'Moxing-ModelReading'
}

{ #category : #visiting }
MOAngularAttributesExtractor >> initialize [ 
	super initialize. 
	attributes := Dictionary new 
]

{ #category : #'as yet unclassified' }
MOAngularAttributesExtractor >> registerNameValueElement: aCSNUIElement [

	| value |
	self assert: (aCSNUIElement attributeValue isString or: [ 
			 aCSNUIElement attributeValue isNumber ]).
	value := aCSNUIElement attributeValue isFraction
		         ifTrue: [ aCSNUIElement attributeValue asFloat asString ]
		         ifFalse: [ aCSNUIElement attributeValue asString ].

	attributes at: aCSNUIElement name put: value
]

{ #category : #accessing }
MOAngularAttributesExtractor >> result [

	^ attributes
]

{ #category : #visiting }
MOAngularAttributesExtractor >> visitCSNAttribute: aCSNUITop [ 
	self registerNameValueElement: aCSNUITop 
]

{ #category : #visiting }
MOAngularAttributesExtractor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [ 
	self registerNameValueElement: aCSNUIAbsoluteHeight
]

{ #category : #visiting }
MOAngularAttributesExtractor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	self registerNameValueElement: aCSNUIAbsoluteWidth.
	
]

{ #category : #visiting }
MOAngularAttributesExtractor >> visitCSNUILabel: aCSNUILabel [ 
	" Label is not mapped to an attribute, but to a body. "
]
