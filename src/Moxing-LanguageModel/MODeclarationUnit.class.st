Class {
	#name : #MODeclarationUnit,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#imports => MOStatesSlot many',
		'#declarations'
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
MODeclarationUnit >> declarations [
	 ^ declarations
]

{ #category : #accessing }
MODeclarationUnit >> declarations: aCollection [ 
	declarations := aCollection
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

	^ self types flatCollect: [ :a | a inheritanceTypeReferences ]
]

{ #category : #accessing }
MODeclarationUnit >> initialize [ 
	super initialize .
	imports := OrderedCollection new. 
	declarations := OrderedCollection new 
]

{ #category : #'as yet unclassified' }
MODeclarationUnit >> isDeclarationUnit [

	^ true
]

{ #category : #'as yet unclassified' }
MODeclarationUnit >> isDefinedInLibrary [

	^ parent ifNil: [ false ] ifNotNil: [ parent isDefinedInLibrary ]
]

{ #category : #accessing }
MODeclarationUnit >> name: aName [
 	self halt.
]

{ #category : #accessing }
MODeclarationUnit >> packageReference: aMOPackageReference [

	self types do: [ :t | t packageReference: aMOPackageReference ]
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

	^ declarations isNotEmpty and: [ 
		  declarations allSatisfy: [ :t | t producesParseableCode ] ]
]

{ #category : #accessing }
MODeclarationUnit >> types [

	^ (declarations select: [ :d | d isType ]) reverse
]

{ #category : #accessing }
MODeclarationUnit >> users [

	^ (self types flatCollect: #users) removeDuplicates
]

{ #category : #accessing }
MODeclarationUnit >> usersOrSenders [

	^ self users
]
