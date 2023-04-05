Class {
	#name : #MOLambdaWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-LanguageModel-Writting'
}

{ #category : #visiting }
MOLambdaWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClosureWriter: self 


]

{ #category : #adding }
MOLambdaWriter >> addParameter: aMOParameter [
  writeBuilder addParameter: aMOParameter
]

{ #category : #accessing }
MOLambdaWriter >> block: aMOBlock [

	writeBuilder block: aMOBlock
]

{ #category : #initialization }
MOLambdaWriter >> initializeWriteBuilder [

	writeBuilder := builder lambdaBuilder
]

{ #category : #writing }
MOLambdaWriter >> privateWriteToSurface: aBlockClosure [

	^ aBlockClosure
	"	^ surface expression: aBlockClosure"
]

{ #category : #writing }
MOLambdaWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOLambdaWriter >> writeParameter: aBlock [

	^ self write: aBlock inSubWriter: MOParameterWriter
]

{ #category : #writing }
MOLambdaWriter >> writeVariable: aFullBlockClosure [

	^ self writeParameter: aFullBlockClosure
]
