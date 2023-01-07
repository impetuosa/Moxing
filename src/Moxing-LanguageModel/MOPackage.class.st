Class {
	#name : #MOPackage,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'#types => MODeclaresSlot many',
		'#declarationUnits => MODeclaresSlot many',
		'#packageReference => MORefersSlot one',
		'#isDefinedInLibrary => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOPackage >> acceptVisitor: aVisitor [

	^ aVisitor visitPackage: self
]

{ #category : #adding }
MOPackage >> addDeclarationUnit: aMODeclarationUnit [

	declarationUnits add: aMODeclarationUnit
]

{ #category : #accessing }
MOPackage >> allTypes [

	^ types , (declarationUnits flatCollect: [ :u | u types ])
]

{ #category : #adding }
MOPackage >> childrenForTree [

	^ super childrenForTree sort:
		  #isDefinedInLibrary ascending , #printString ascending
]

{ #category : #adding }
MOPackage >> containsSourceCodeEntities [

	^ true
]

{ #category : #accessing }
MOPackage >> declarationUnits [
	^ declarationUnits
]

{ #category : #accessing }
MOPackage >> declarationUnits: asetOfDeclarationUnits [

	declarationUnits := asetOfDeclarationUnits
]

{ #category : #adding }
MOPackage >> flagIsDefinedInLibrary [
	^ isDefinedInLibrary ifNil: [ false ]
]

{ #category : #adding }
MOPackage >> fullName [

	^ ((self parent isKindOf: MOPackage)
		   ifTrue: [ self parent fullName , '.' ]
		   ifFalse: [ '' ]) , self name
]

{ #category : #adding }
MOPackage >> initialize [

	super initialize.
	declarationUnits := OrderedCollection new. 
	types := OrderedCollection new.
]

{ #category : #accessing }
MOPackage >> isDeclaration [

	^ true
]

{ #category : #adding }
MOPackage >> isDefinedInLibrary [

	^ self flagIsDefinedInLibrary or: [ "or: [ 
		  (types allSatisfy: #isDefinedInLibrary) and: [ 
			  declarationUnits allSatisfy: #isDefinedInLibrary ] ]" 
		  self parent isDefinedInLibrary ]
]

{ #category : #adding }
MOPackage >> isDefinedInLibrary: aValue [
 	isDefinedInLibrary := aValue 
]

{ #category : #testing }
MOPackage >> isPackage [
	^ true
]

{ #category : #accessing }
MOPackage >> packageReference [
	^ packageReference
]

{ #category : #accessing }
MOPackage >> packageReference: aPackageReference [

	" if the pack is child of an other package. "

	packageReference := aPackageReference
]

{ #category : #accessing }
MOPackage >> parent: aParent [

	super parent: aParent
]

{ #category : #adding }
MOPackage >> printOn: aStream [

	aStream
		nextPutAll: 'package: ';
		nextPutAll: self fullName
]

{ #category : #accessing }
MOPackage >> types [
	^ types
]

{ #category : #accessing }
MOPackage >> types: asetOfTypes [

	types := asetOfTypes
]
