Class {
	#name : #MOBlock,
	#superclass : #MOLanguageObject,
	#instVars : [
		'statements'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOBlock >> acceptVisitor: aMOTypescriptCodeGenerator [ 
	aMOTypescriptCodeGenerator visitBlock: self 
]

{ #category : #adding }
MOBlock >> addStatement: aMOAssignment [

	aMOAssignment isCollection
		ifTrue: [ statements addAll: aMOAssignment ]
		ifFalse: [ statements add: aMOAssignment ]
]

{ #category : #adding }
MOBlock >> addVariable: aMOVariable [ 
	statements add: aMOVariable 
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
