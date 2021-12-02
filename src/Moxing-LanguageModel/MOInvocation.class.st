Class {
	#name : #MOInvocation,
	#superclass : #MOTypedReference,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOInvocation >> acceptVisitor: aMOTransformationApplier [ 
	aMOTransformationApplier visitInvocation: self 
]

{ #category : #accessing }
MOInvocation >> arguments [
	^ arguments ifNil: [  arguments := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOInvocation >> arguments: aCollection [ 
	aCollection isCollection ifFalse: [ self halt  ].
	arguments := aCollection
]

{ #category : #accessing }
MOInvocation >> printOn: aStream [

	aStream
		nextPutAll: 'CALL ';
		nextPutAll: selector;
		nextPutAll: '\';
		nextPutAll: arguments size asString
]

{ #category : #accessing }
MOInvocation >> selector [
	^ selector
]

{ #category : #accessing }
MOInvocation >> selector: aString [ 
	selector := aString
]
