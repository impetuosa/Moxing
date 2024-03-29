Class {
	#name : #MORootDeclaration,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#packages => MODeclaresSlot many',
		'#name => MOPropertySlot'
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

{ #category : #testing }
MORootDeclaration >> canBeDescribedBy: anOtherObject with: aSlot [

	self language isStonReference ifTrue: [ ^ true ].
	^ self language can: self beDescribedBy: anOtherObject with: aSlot
]

{ #category : #testing }
MORootDeclaration >> canBeParentedBy: aMOModel with: aMOParentSlot [

	^ aMOModel isMOModel
]

{ #category : #testing }
MORootDeclaration >> canDeclare: anOtherObject with: aSlot [

	parent isStonReference ifTrue: [ ^ true ].
	^ self language can: self declare: anOtherObject with: aSlot
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
MORootDeclaration >> name: aString [ 
	name := aString
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
