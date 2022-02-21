Class {
	#name : #MOBlock,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#statements => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOBlock >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitBlock: self
]

{ #category : #adding }
MOBlock >> initialize [

	super initialize.
	statements := OrderedCollection new
]

{ #category : #accessing }
MOBlock >> statements [
	^ statements
]

{ #category : #accessing }
MOBlock >> statements: aCollection [
	statements := aCollection
]
