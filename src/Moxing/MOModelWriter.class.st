Class {
	#name : #MOModelWriter,
	#superclass : #Object,
	#instVars : [
		'model',
		'builder',
		'entity'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOModelWriter >> addPackage: aMOPackage [

	self assert: (model entities includes: aMOPackage).
	entity := aMOPackage
]

{ #category : #'as yet unclassified' }
MOModelWriter >> buildExpression: aFullBlockClosure [

	^ (aFullBlockClosure value: builder) build
]

{ #category : #accessing }
MOModelWriter >> builder: aMOModelBuilder [ 
	builder := aMOModelBuilder
]

{ #category : #accessing }
MOModelWriter >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelWriter >> typeReferenceNamed: aString [

	^ builder typeReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelWriter >> variableReferenceNamed: aString [

	^ builder variableReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelWriter >> writePackage: aBlock [
	| writer | 
	writer := MOPackageWriter new. 
	writer builder: builder. 
	writer surface: self . 
	writer initializeWriteBuilder.
	writer write: aBlock.
	^ entity 
]
