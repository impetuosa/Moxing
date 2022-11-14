Class {
	#name : #MOTryCatch,
	#superclass : #MOStatement,
	#instVars : [
		'#try => MODeclaresSlot one',
		'#catches => MODeclaresSlot many',
		'#finally => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOTryCatch >> acceptVisitor: aVisitor [

	^ aVisitor visitTryCatch: self 
]

{ #category : #'private parsing' }
MOTryCatch >> catches [
	^ catches
]

{ #category : #generated }
MOTryCatch >> catches: aCollection [

	catches := aCollection
]

{ #category : #'private parsing' }
MOTryCatch >> dependencies [

	^ try dependencies , (catches flatCollect: [ :a | a dependencies ])
]

{ #category : #accessing }
MOTryCatch >> finally [

	^ finally
]

{ #category : #accessing }
MOTryCatch >> finally: anObject [

	finally := anObject
]

{ #category : #'private parsing' }
MOTryCatch >> try [
	^ try
]

{ #category : #'private parsing' }
MOTryCatch >> try: aMOBlock [

	try := aMOBlock
]
