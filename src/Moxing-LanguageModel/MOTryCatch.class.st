Class {
	#name : #MOTryCatch,
	#superclass : #MOStatement,
	#instVars : [
		'#try => MOContainmentSlot one',
		'#catches => MOContainmentSlot many'
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
MOTryCatch >> try [
	^ try
]

{ #category : #'private parsing' }
MOTryCatch >> try: aMOBlock [

	try := aMOBlock
]
