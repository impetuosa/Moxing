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
MORootDeclaration >> packages [

	^ packages ifNil: [ packages := OrderedCollection new ]
]
