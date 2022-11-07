Class {
	#name : #MOModule,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#invocables => MODeclaresSlot many',
		'#variables => MODeclaresSlot many',
		'#constants => MODeclaresSlot many',
		'#types => MODeclaresSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOModule >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitModule: self
]

{ #category : #accessing }
MOModule >> canBeReferredAsType [
	 ^ true 
]

{ #category : #accessing }
MOModule >> constants [
	^ constants
]

{ #category : #accessing }
MOModule >> constants: aCollection [ 
	constants := aCollection
]

{ #category : #adding }
MOModule >> enclosingTypeOrModule [

	^ self
]

{ #category : #generated }
MOModule >> imports [
	^ {  }
]

{ #category : #adding }
MOModule >> initialize [

	super initialize.
	invocables := OrderedCollection new
]

{ #category : #'as yet unclassified' }
MOModule >> invocableNamed: aString [

	| i |
	i := invocables select: [ :a | a selector = aString ].
	self assert: i size = 1.
	^ i first
]

{ #category : #'as yet unclassified' }
MOModule >> invocableNamed: aString parameters: aCollection [

	^ invocables detect: [ :a | 
		  a selector = aString and: [
			  (a parameters collect: [ :p | p typeReference name ]) asArray
			  = aCollection ] ]
]

{ #category : #'as yet unclassified' }
MOModule >> invocableNamed: aString returns: aTypeName [

	| i |
	i := invocables select: [ :a | 
		     a selector = aString and: [ 
			     a returnTypeReference name = aTypeName ] ].
	self assert: i size = 1.
	^ i first
]

{ #category : #accessing }
MOModule >> invocables [
	^ invocables
]

{ #category : #accessing }
MOModule >> invocables: aCollection [ 
	invocables := aCollection
]

{ #category : #'as yet unclassified' }
MOModule >> invocablesNamed: aString [

	| i |
	i := invocables select: [ :a | a selector = aString ].
	self assert:
		(i allSatisfy: [ :a | a parameters size = i first parameters size ]).
	^ i
]

{ #category : #accessing }
MOModule >> isDeclaration [

	^ true
]

{ #category : #testing }
MOModule >> isDefinedInLibrary [

	^ self parent isDefinedInLibrary "or: [ 
		  self isInTheContextOfA: MOLibrary ]"
]

{ #category : #accessing }
MOModule >> isModule [

	^ true
]

{ #category : #testing }
MOModule >> isTable [
	^ false
]

{ #category : #'archive operations' }
MOModule >> memberNamed: aString [

	^ variables detect: [ :a | a name = aString ]
]

{ #category : #accessing }
MOModule >> packageReference: aMOPackageReference [ 

]

{ #category : #accessing }
MOModule >> printOn: aStream [

	aStream
		nextPutAll: 'module: ';
		nextPutAll:self name
]

{ #category : #accessing }
MOModule >> producesParseableCode [

	^ true
]

{ #category : #visiting }
MOModule >> symbolicName [

	^ name
]

{ #category : #accessing }
MOModule >> types [
	^ types
]

{ #category : #accessing }
MOModule >> types: aCollection [

	types := aCollection
]

{ #category : #accessing }
MOModule >> users [

	| candidates referrals |
	candidates := self model references
		              select: [ :r | r candidate = self ]
		              thenCollect: [ :r | 
			              | i |
			              i := r callingInvocable ].
	referrals := self symbolicName.
	^ ((self model literals
		    select: [ :l | l literal = referrals ]
		    thenCollect: [ :r | 
			    | i |
			    i := r callingInvocable ]) , (self model objects
		    select: [ :o | 
			    o holder ~= self and: [ 
				    o state values anySatisfy: [ :v | v = referrals ] ] ]
		    thenCollect: [ :o | o holder ]) , candidates) removeDuplicates
]

{ #category : #accessing }
MOModule >> usersOrSenders [

	^ self users
]

{ #category : #accessing }
MOModule >> variables [
	^ variables
]

{ #category : #accessing }
MOModule >> variables: aCollection [ 
	variables := aCollection
]
