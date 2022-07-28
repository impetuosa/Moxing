Class {
	#name : #MORootDeclaration,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#packages => MOContainmentSlot many'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MORootDeclaration >> acceptVisitor: aVisitor [

	^ aVisitor visitRootDeclaration: self
]

{ #category : #accessing }
MORootDeclaration >> addPackage: anEntry [

	self packages add: anEntry.
	anEntry parent: self.
	
]

{ #category : #accessing }
MORootDeclaration >> childrenForTree [

	^ super childrenForTree sort:
		  #isDefinedInLibrary ascending , #name ascending
]

{ #category : #'as yet unclassified' }
MORootDeclaration >> enclosingTypeOrModule [

	^ nil
]

{ #category : #testing }
MORootDeclaration >> isExpression [

	^ false
]

{ #category : #accessing }
MORootDeclaration >> isRootDeclaration [

	^ true
]

{ #category : #accessing }
MORootDeclaration >> language [

	^ self  parent language
]

{ #category : #accessing }
MORootDeclaration >> language: aMOLanguage [ 
	" nothing to do here "
]

{ #category : #accessing }
MORootDeclaration >> model [

	^ parent
]

{ #category : #accessing }
MORootDeclaration >> packages [
	^ packages 
	ifNil: [ packages := OrderedCollection new ]
]

{ #category : #accessing }
MORootDeclaration >> packages: aCollection [

	self assert: packages == aCollection
]

{ #category : #accessing }
MORootDeclaration >> printOn: aStream [

	aStream
		nextPutAll: 'root: ';
		nextPutAll: self parent name
]
