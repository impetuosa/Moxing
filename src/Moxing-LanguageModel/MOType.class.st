Class {
	#name : #MOType,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#modifiers => MOPropertySlot',
		'#visibility => MOPropertySlot',
		'#packageReference => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOType >> addModifier: aModifier [

	modifiers add: aModifier
]

{ #category : #accessing }
MOType >> canBeReferredAsType [
	 ^ true
]

{ #category : #accessing }
MOType >> enclosingTypeOrModule [

	^ self
]

{ #category : #accessing }
MOType >> fullName [

	^ (packageReference ifNotNil: [ : p  |  p name , '.'  ] ifNil: [ '' ]), self name
]

{ #category : #accessing }
MOType >> initialize [

	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #generated }
MOType >> isAbstract [

	^ self language isAbstractType: self
]

{ #category : #accessing }
MOType >> isDeclaration [

	^ true
]

{ #category : #accessing }
MOType >> isDefinedInLibrary [

	^ modifiers
		  ifNil: [ false ]
		  ifNotNil: [ :a | a includes: #DefinedInLibrary ]
]

{ #category : #testing }
MOType >> isQuery [
	^ false 
]

{ #category : #testing }
MOType >> isTable [

	^ false
]

{ #category : #accessing }
MOType >> isType [ 
	 ^ true 
]

{ #category : #accessing }
MOType >> isWidget [ 
 	 ^ false 
]

{ #category : #accessing }
MOType >> modifiers [

	^ modifiers
		  ifNil: [ nil ]
		  ifNotNil: [ :m | m reject: [ :a | a = #DefinedInLibrary ] ]
]

{ #category : #accessing }
MOType >> modifiers: aSet [
	modifiers := aSet
]

{ #category : #accessing }
MOType >> packageName [

	^ packageReference name
]

{ #category : #accessing }
MOType >> packageReference [

	^ packageReference 
]

{ #category : #'as yet unclassified' }
MOType >> packageReference: aPackageReference [
	packageReference := aPackageReference
]

{ #category : #accessing }
MOType >> packageReferenceName [
	^ packageReference ifNotNil: [ :r | r name  ]
]

{ #category : #'as yet unclassified' }
MOType >> parentForContext [

	^ self parent ifNotNil: [ :p | p isPackage ifFalse: [ p parent ] ]
]

{ #category : #'as yet unclassified' }
MOType >> producesParseableCode [
	 ^ true
]

{ #category : #accessing }
MOType >> symbolicName [
	 ^ self name 
]

{ #category : #accessing }
MOType >> users [

	| candidates referrals |
	candidates := self model references
		              select: [ :r | r candidate = self ]
		              thenCollect: [ :r | 
			              | i |
			              i := r usingDeclaration ].
	referrals := self symbolicName.
	^ ((self model literals
		    select: [ :l | l literal = referrals ]
		    thenCollect: [ :r | 
			    | i |
			    i := r usingDeclaration ]) , (self model objects
		    select: [ :o | 
			    o holder ~= self and: [ 
				    o state values anySatisfy: [ :v | v = referrals ] ] ]
		    thenCollect: [ :o | o holder ]) , candidates) removeDuplicates
]

{ #category : #accessing }
MOType >> usersOrSenders [

	^ self users
]

{ #category : #accessing }
MOType >> visibility [
	^ visibility
]

{ #category : #accessing }
MOType >> visibility: aVisibility [ 
	
	visibility :=  aVisibility 
]
