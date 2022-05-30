Class {
	#name : #MONamedDeclaration,
	#superclass : #MODeclaration,
	#instVars : [
		'#name => MOPropertySlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #testing }
MONamedDeclaration class >> isRenamable [
	^ false 
]

{ #category : #accessing }
MONamedDeclaration >> isRenamable [

	^ self class isRenamable
]

{ #category : #accessing }
MONamedDeclaration >> name [

	^ name  
]

{ #category : #accessing }
MONamedDeclaration >> name: aString [ 

	name := aString
]
