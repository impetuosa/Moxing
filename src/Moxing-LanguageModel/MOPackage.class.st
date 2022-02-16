Class {
	#name : #MOPackage,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#types => MOContainmentSlot many',
		'#declarationUnits => MOContainmentSlot many',
		'#packageReference => MOReferenceSlot one'
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

{ #category : #accessing }
MOPackage >> declarationUnits [
	^ declarationUnits
]

{ #category : #accessing }
MOPackage >> declarationUnits: asetOfDeclarationUnits [

	declarationUnits := asetOfDeclarationUnits
]

{ #category : #adding }
MOPackage >> fullName [

	^ ((parent isKindOf: MOPackage)
		   ifTrue: [ parent fullName , '.' ]
		   ifFalse: [ '' ]) , self name
]

{ #category : #adding }
MOPackage >> initialize [

	super initialize.
	declarationUnits := OrderedCollection new. 
	types := OrderedCollection new.
]

{ #category : #accessing }
MOPackage >> packageReference: aPackageReference [

	" if the pack is child of an other package. "

	packageReference := aPackageReference
]

{ #category : #adding }
MOPackage >> printOn: aStream [

	aStream
		nextPutAll: 'package: ';
		nextPutAll: self fullName
]

{ #category : #accessing }
MOPackage >> types: asetOfTypes [

	types := asetOfTypes
]
