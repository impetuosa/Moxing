Class {
	#name : #MOLoopWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOLoopWriter >> setLoopingBlock: aBlock [

	writeBuilder loopingBlock: aBlock
]

{ #category : #writing }
MOLoopWriter >> writeLoopingBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #setLoopingBlock: ]
]
