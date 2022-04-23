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
MORootDeclaration >> language [

	^ parent language
]

{ #category : #accessing }
MORootDeclaration >> language: aMOLanguage [ 
	" nothing to do here "
]

{ #category : #accessing }
MORootDeclaration >> packages [

	^ packages ifNil: [ packages := OrderedCollection new ]
]

{ #category : #accessing }
MORootDeclaration >> packages: aCollection [

	self assert: packages == aCollection
]
