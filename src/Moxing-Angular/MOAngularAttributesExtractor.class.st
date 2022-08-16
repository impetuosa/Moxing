Class {
	#name : #MOAngularAttributesExtractor,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'brush'
	],
	#category : #'Moxing-Angular-Building'
}

{ #category : #'as yet unclassified' }
MOAngularAttributesExtractor >> forBrush: aMOCasinoAngularSimpleBrush [ 
	brush := aMOCasinoAngularSimpleBrush 
	
]

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
MOAngularAttributesExtractor >> visitCGDataBinding: aCGDataBinding [ 
	" Nothing to do here "
]

{ #category : #visiting }
MOAngularAttributesExtractor >> visitCGEvent: aCGEvent [

	| key |
	aCGEvent eventName = #AfterUpdate ifTrue: [ key := '(change)' ].
	aCGEvent eventName = #Click ifTrue: [ key := '(click)' ].
	self assert: key isNotNil.
	attributes at: key put: aCGEvent method selector , '()'
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
