Class {
	#name : #MOWithWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOWithWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitWithWriter: self 


]

{ #category : #accessing }
MOWithWriter >> block: aMOBlock [ 
	writeBuilder block: aMOBlock 
]

{ #category : #generated }
MOWithWriter >> expression: aMOMethodInvocation [ 
	writeBuilder expression: aMOMethodInvocation 
]

{ #category : #writing }
MOWithWriter >> initializeWriteBuilder [
	writeBuilder := builder withBuilder. 
]

{ #category : #writing }
MOWithWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]
