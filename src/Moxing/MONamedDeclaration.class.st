Class {
	#name : #MONamedDeclaration,
	#superclass : #MODeclaration,
	#instVars : [
		'#name => MOPropertySlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MONamedDeclaration >> name [

	^ name  
]

{ #category : #accessing }
MONamedDeclaration >> name: aString [ 
	aString ifNil: [ self halt ].
	name := aString
]
