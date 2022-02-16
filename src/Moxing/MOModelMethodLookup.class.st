"
I implement a method lookup for single parent object oriented fashion
"
Class {
	#name : #MOModelMethodLookup,
	#superclass : #Object,
	#instVars : [
		'resolving'
	],
	#category : #'Moxing-Linking'
}

{ #category : #'as yet unclassified' }
MOModelMethodLookup >> lookMethodFor: aMOMethodInvocation in: aTypeWithMethods [

	| methods |
	methods := aTypeWithMethods methods select: [ :m | 
		           m selector = aMOMethodInvocation selector and: [ 
			           m parameters size = aMOMethodInvocation arguments size ] ].


	methods size = 1 ifTrue: [ ^ methods ].
	methods size > 1 ifTrue: [ self error: 'Many method respond to the same signature!' ].

	^ (aTypeWithMethods superclassReference
		   ifNotNil: [ :c | c candidate isNotNil ]
		   ifNil: [ false ])
		  ifFalse: [ methods ]
		  ifTrue: [ 
			  self
				  lookMethodFor: aMOMethodInvocation
				  in: aTypeWithMethods superclassReference candidate ]
]

{ #category : #'as yet unclassified' }
MOModelMethodLookup >> lookupMethodFor: aMOMethodInvocation [

	| type  |
	resolving := aMOMethodInvocation.
	type := aMOMethodInvocation receiverReference acceptVisitor: self.



	^ self lookMethodFor: aMOMethodInvocation in: type
]

{ #category : #visiting }
MOModelMethodLookup >> visitMethodInvocation: aMOMethodInvocation [

	^ aMOMethodInvocation candidate returnTypeReference candidate
]

{ #category : #visiting }
MOModelMethodLookup >> visitSelfReference: aMOSelfReference [

	^ aMOSelfReference callingClass
]

{ #category : #visiting }
MOModelMethodLookup >> visitVariableReference: aMOVariableReference [

	^ aMOVariableReference candidate typeReference candidate
]
