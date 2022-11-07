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
MONoOp >> candidate: aMOEnumEntry [ 
	candidate := aMOEnumEntry 
]

{ #category : #accessing }
MONoOp >> description [
	^ description
]

{ #category : #accessing }
MONoOp >> description: aString [ 
	description := aString
]

{ #category : #'as yet unclassified' }
MONoOp >> refersToObjectsLikeOrStonRef: aMOEnumEntry [

	^ true
]
