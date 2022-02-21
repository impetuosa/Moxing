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

	writeBuilder tryCatch: (self writeBlock: aFullBlockClosure)
]
