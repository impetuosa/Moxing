Class {
	#name : #MOAlceQuery,
	#superclass : #MOClass,
	#instVars : [
		'#sql => MOPropertySlot',
		'#expressions => MOExpressesSlot many'
	],
	#category : #'Moxing-Access-Declaration'
}

{ #category : #visiting }
MOAlceQuery >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitQuery: self
]

{ #category : #visiting }
MOAlceQuery >> childrenForTree [

	^ super childrenForTree , expressions
]

{ #category : #accessing }
MOAlceQuery >> expressions [
	^ expressions
]

{ #category : #accessing }
MOAlceQuery >> expressions: aCollection [ 
	expressions := aCollection
]

{ #category : #testing }
MOAlceQuery >> hasIdColumns [
	^ false
]

{ #category : #visiting }
MOAlceQuery >> isDatasource [ 
	 ^ true
]

{ #category : #testing }
MOAlceQuery >> isQuery [

	^ true
]

{ #category : #testing }
MOAlceQuery >> produceCode [

	^ sql
]

{ #category : #testing }
MOAlceQuery >> producesParseableCode [

	^ sql isNotEmpty
]

{ #category : #testing }
MOAlceQuery >> sql [

	^ sql
]

{ #category : #testing }
MOAlceQuery >> sql: aString [ 	
	sql := aString 
]

{ #category : #testing }
MOAlceQuery >> users [

	| candidates referrals |
	candidates := self model references
		              select: [ :r | r referee = self ]
		              thenCollect: [ :r | 
			              | i |
			              i := r callingInvocable ].
	referrals := self symbolicName.
	^ ((self model literals
		    select: [ :l | 
		    l literal includesSubstring: referrals caseSensitive: false ]
		    thenCollect: [ :r | 
			    | i |
			    i := r callingInvocable ]) , (self model objects
		    select: [ :o | 
			    o holder ~= self and: [ 
				    o state values anySatisfy: [ :v | v = referrals ] ] ]
		    thenCollect: [ :o | o holder ]) , candidates) removeDuplicates
]
