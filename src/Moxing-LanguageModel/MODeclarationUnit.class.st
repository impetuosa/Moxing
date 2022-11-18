Class {
	#name : #MODeclarationUnit,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#imports => MOStatesSlot many',
		'#types => MODeclaresSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #'as yet unclassified' }
MODeclarationUnit class >> isRenamable [

	^ false
]

{ #category : #accessing }
MODeclarationUnit >> acceptVisitor: aMOModelTypeLinker [

	^ aMOModelTypeLinker visitDeclarationUnit: self
]

{ #category : #accessing }
MODeclarationUnit >> imports [
	^ imports
]

{ #category : #accessing }
MODeclarationUnit >> imports: aCollection [ 
	imports := aCollection
]

{ #category : #'as yet unclassified' }
MODeclarationUnit >> inheritanceTypeReferences [

	^ types flatCollect: [ :a | a inheritanceTypeReferences ]
]

{ #category : #accessing }
MODeclarationUnit >> initialize [ 
	super initialize .
	imports := OrderedCollection new. 
	types := OrderedCollection new 
]

{ #category : #'as yet unclassified' }
MODeclarationUnit >> isDeclarationUnit [

	^ true
]

{ #category : #'as yet unclassified' }
MODeclarationUnit >> isDefinedInLibrary [

	^ parent isDefinedInLibrary
]

{ #category : #accessing }
MODeclarationUnit >> name: aName [
 	self halt.
]

{ #category : #accessing }
MODeclarationUnit >> packageReference: aMOPackageReference [

	types do: [ :t | t packageReference: aMOPackageReference ]
]

{ #category : #accessing }
MODeclarationUnit >> printOn: aStream [
	aStream nextPutAll: 'DUnit '.
	self types do: [ :t | 
		t printOn: aStream.
		aStream nextPutAll: ',' ]
]

{ #category : #accessing }
MODeclarationUnit >> producesParseableCode [

	^ types isNotEmpty and: [ 
		  types allSatisfy: [ :t | t producesParseableCode ] ]
]

{ #category : #accessing }
MODeclarationUnit >> types [
	^ types reverse
]

{ #category : #accessing }
MODeclarationUnit >> types: aCollection [ 
	types := aCollection
]

{ #category : #accessing }
MODeclarationUnit >> users [

	^ (types flatCollect: #users) removeDuplicates
]

{ #category : #accessing }
MODeclarationUnit >> usersOrSenders [

	^ self users
]
