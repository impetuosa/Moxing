Class {
	#name : #MOCatch,
	#superclass : #MOInvocableStatement,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOCatch >> acceptVisitor: aVisitor [

	^ aVisitor visitCatch: self 
]

{ #category : #printing }
MOCatch >> printOn: aStream [

	aStream
		nextPutAll: 'Catch '.
		
		 parameters do: [ : p | aStream print: p; nextPutAll:' ' ].

	
]
