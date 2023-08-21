Class {
	#name : #MOTryCatchWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOTryCatchWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitCatchWriter: self 


]

{ #category : #adding }
MOTryCatchWriter >> addCatch: aMOCatch [

	writeBuilder addCatch: aMOCatch
]

{ #category : #generated }
MOTryCatchWriter >> finallyBlock: aMOBlock [

	writeBuilder finallyBlock: aMOBlock
]

{ #category : #writing }
MOTryCatchWriter >> initializeWriteBuilder [

	writeBuilder := builder tryCatchBuilder
]

{ #category : #generated }
MOTryCatchWriter >> tryBlock: aMOBlock [

	writeBuilder tryBlock: aMOBlock
]

{ #category : #writing }
MOTryCatchWriter >> winitializeWriteBuilder [

	writeBuilder := builder tryCatchBuilder
]

{ #category : #writing }
MOTryCatchWriter >> writeCatch: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOCatchWriter
]

{ #category : #writing }
MOTryCatchWriter >> writeFinally: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #finallyBlock: ]
]

{ #category : #writing }
MOTryCatchWriter >> writeTry: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #tryBlock: ]
]
