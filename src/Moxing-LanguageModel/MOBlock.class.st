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
MOBlock >> addStatement: aMOAssignment [
	aMOAssignment isCollection
		ifTrue: [ statements addAll: aMOAssignment ]
		ifFalse: [ statements add: aMOAssignment ]
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
	(aCollection anySatisfy: [ :a | a isKindOf: MOBlock ]) ifTrue: [ self halt  ].
	statements := aCollection
]
