Class {
	#name : #MOBlock,
	#superclass : #MOEmptyBlock,
	#instVars : [
		'#statements => MOStatesSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOBlock >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitBlock: self
]

{ #category : #accessing }
MOBlock >> childrenForTree [

	^ self allContainments
]

{ #category : #accessing }
MOBlock >> dependencies [

	^ self statements flatCollect: [ :a | a dependencies ]
]

{ #category : #adding }
MOBlock >> initialize [

	super initialize.
	statements := OrderedCollection new
]

{ #category : #testing }
MOBlock >> isEmptyOrNil [

	^ statements isEmptyOrNil
]

{ #category : #testing }
MOBlock >> isMOBlock [

	^ true
]

{ #category : #accessing }
MOBlock >> printOn: aStream [

	aStream
		nextPutAll: 'Block(';
		print: statements size;
		nextPutAll: ')'
]

{ #category : #accessing }
MOBlock >> statements [
	^ statements
]

{ #category : #accessing }
MOBlock >> statements: aCollection [
	statements := aCollection
	

]
