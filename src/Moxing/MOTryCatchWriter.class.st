Class {
	#name : #MOTryCatchWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOTryCatchWriter >> addCatch: aMOCatch [

	writeBuilder addCatch: aMOCatch
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
MOTryCatchWriter >> writeTry: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #tryBlock: ]
]
