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

	^ aTypeWithMethods isClassLike
		  ifTrue: [ 
		  self lookMethodFor: aMOMethodInvocation inClass: aTypeWithMethods ]
		  ifFalse: [ 
		  self lookMethodFor: aMOMethodInvocation inType: aTypeWithMethods ]
]

{ #category : #'as yet unclassified' }
MOModelMethodLookup >> lookMethodFor: aMOMethodInvocation inClass: aTypeWithMethods [

	| methods |
	methods := aTypeWithMethods methods select: [ :m | 
		           m selector = aMOMethodInvocation selector and: [ 
			           m parameters size = aMOMethodInvocation arguments size ] ].


	methods size = 1 ifTrue: [ ^ methods ].
	methods size > 1 ifTrue: [ ^ {  } ].

	^ (aTypeWithMethods superclassReference
		   ifNotNil: [ :c | c referee isNotNil ]
		   ifNil: [ false ])
		  ifFalse: [ methods ]
		  ifTrue: [ 
			  aTypeWithMethods superclassReference referee = aTypeWithMethods 
				  ifTrue: [ ^ {  } ].
			  self
				  lookMethodFor: aMOMethodInvocation
				  inClass: aTypeWithMethods superclassReference referee ]
]

{ #category : #'as yet unclassified' }
MOModelMethodLookup >> lookMethodFor: aMOMethodInvocation inType: aTypeWithMethods [

	| methods |
	methods := aTypeWithMethods methods select: [ :m | 
		           m selector = aMOMethodInvocation selector and: [ 
			           m parameters size = aMOMethodInvocation arguments size ] ].


	methods size = 1 ifTrue: [ ^ methods ].
	methods size > 1 ifTrue: [ ^ {  } ].

	aTypeWithMethods superTypeReferences do: [ :st | 
		st referee ifNotNil: [ 
			methods := self
				           lookMethodFor: aMOMethodInvocation
				           inType: st referee.
			methods size = 1 ifTrue: [ ^ methods ].
			methods size > 1 ifTrue: [ ^ {  } ] ] ].
	^ methods
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
