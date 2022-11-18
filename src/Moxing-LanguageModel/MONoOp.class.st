Class {
	#name : #MONoOp,
	#superclass : #MOExpression,
	#instVars : [
		'#description => MOPropertySlot',
		'#candidate => MORefereeSlot'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MONoOp >> acceptVisitor: aMOJavaCodeGenerator [

	^ aMOJavaCodeGenerator visitNoOp: self
]

{ #category : #accessing }
MONoOp >> description [
	^ description
]

{ #category : #accessing }
MONoOp >> description: aString [ 
	description := aString
]

{ #category : #accessing }
MONoOp >> referee: aMOEnumEntry [ 
	candidate := aMOEnumEntry 
]

{ #category : #'as yet unclassified' }
MONoOp >> refersToObjectsLikeOrStonRef: aMOEnumEntry [

	^ true
]
