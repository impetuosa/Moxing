Class {
	#name : #MODeclarationUnit,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#imports => MOContainmentSlot many',
		'#types => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MODeclarationUnit >> acceptVisitor: aMOModelTypeLinker [

	aMOModelTypeLinker visitDeclarationUnit: self
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

{ #category : #accessing }
MODeclarationUnit >> packageReference: aMOPackageReference [

	types do: [ :t | t packageReference: aMOPackageReference ]
]

{ #category : #accessing }
MODeclarationUnit >> printOn: aStream [
	aStream nextPutAll: 'DUnit '.
	types do: [ :t | 
		t printOn: aStream.
		aStream nextPutAll: ',' ]
]

{ #category : #accessing }
MODeclarationUnit >> types [
	^ types
]

{ #category : #accessing }
MODeclarationUnit >> types: aCollection [ 
	types := aCollection
]
