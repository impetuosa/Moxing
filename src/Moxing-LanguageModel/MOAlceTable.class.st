Class {
	#name : #MOAlceTable,
	#superclass : #MOClass,
	#instVars : [
		'#indexes => MOPropertySlot',
		'#relations => MOExpressionSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceTable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitTable: self
]

{ #category : #visiting }
MOAlceTable >> childrenForTree [

	^ super childrenForTree , relations
]

{ #category : #testing }
MOAlceTable >> hasIdColumns [

	^ indexes isNotNil and: [ 
		  indexes anySatisfy:  [ :a | a key = #PrimaryKey ] ]
]

{ #category : #visiting }
MOAlceTable >> indexes [

	^ indexes
]

{ #category : #visiting }
MOAlceTable >> indexes: si [

	indexes := si
]

{ #category : #visiting }
MOAlceTable >> isDatasource [ 
	 ^ true
]

{ #category : #testing }
MOAlceTable >> isTable [
	^ true 
]

{ #category : #visiting }
MOAlceTable >> producesParseableCode [
	 ^ false
]

{ #category : #visiting }
MOAlceTable >> relations [

	^ relations
]

{ #category : #visiting }
MOAlceTable >> relations: si [

	relations := si
]

{ #category : #visiting }
MOAlceTable >> users [

	| candidates referrals |
	candidates := self model references
		              select: [ :r | r candidate = self ]
		              thenCollect: [ :r | 
			              | i |
			              i := r callingInvocable ].
	referrals := self symbolicName.
	^ ((self model literals
		    select: [ :l | 
			    l literal isString and: [ 
				    l literal includesSubstring: referrals caseSensitive: false ] ]
		    thenCollect: [ :r | 
			    | i |
			    i := r callingInvocable ]) , (self model objects
		    select: [ :o | 
			    o holder ~= self and: [ 
				    o state values anySatisfy: [ :v | v = referrals ] ] ]
		    thenCollect: [ :o | o holder ]) , candidates) removeDuplicates
]
