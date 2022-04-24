"
I implement a method lookup for single parent object oriented fashion
"
Class {
	#name : #MOModelMethodLookup,
	#superclass : #MOModelDeclarationResolver,
	#instVars : [
		'resolving',
		'model'
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
MOModelMethodLookup >> lookupMethodFor: aMOMethodInvocation using: aMOModel [
  | type |
  model := aMOModel.
  resolving := aMOMethodInvocation.
  type := aMOMethodInvocation receiverReference acceptVisitor: self.
  type ifNil: [ ^{} ].
  ^self lookMethodFor: aMOMethodInvocation in: type
]
