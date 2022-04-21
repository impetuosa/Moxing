Class {
	#name : #MOLoopWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOLoopWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitLoopWriter: self 


]

{ #category : #writing }
MOLoopWriter >> loopingBlock: aBlock [

	writeBuilder loopingBlock: aBlock
]

{ #category : #writing }
MOLoopWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #loopingBlock: ]
]
