Class {
	#name : #MOWithWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

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
