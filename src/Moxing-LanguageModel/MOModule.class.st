Class {
	#name : #MOModule,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#invocables => MOContainmentSlot many',
		'#variables => MOContainmentSlot many',
		'#constants => MOContainmentSlot many',
		'#types => MOContainmentSlot many'
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

{ #category : #accessing }
MOModule >> invocables [
	^ invocables
]

{ #category : #accessing }
MOModule >> invocables: aCollection [ 
	invocables := aCollection
]

{ #category : #accessing }
MOModule >> isDeclaration [

	^ true
]

{ #category : #testing }
MOModule >> isDefinedInLibrary [

	^ self isInTheContextOfA: MOLibrary
]

{ #category : #accessing }
MOModule >> isModule [

	^ true
]

{ #category : #testing }
MOModule >> isTable [
	^ false
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
