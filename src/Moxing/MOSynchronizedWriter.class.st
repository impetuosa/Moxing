Class {
	#name : #MOSynchronizedWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOSynchronizedWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitSynchronizedWriter: self
]

{ #category : #writing }
MOSynchronizedWriter >> initializeWriteBuilder [
	writeBuilder := builder synchronizedStatementBuilder 
]

{ #category : #writing }
MOSynchronizedWriter >> lockAccessExpression: anExpression [

	writeBuilder lockAccessExpression: anExpression
]

{ #category : #writing }
MOSynchronizedWriter >> setSynchronizedBlock: aBlock [

	writeBuilder block: aBlock
]

{ #category : #writing }
MOSynchronizedWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | 
		  b messageToRegisterBlock: #setSynchronizedBlock: ]
]

{ #category : #writing }
MOSynchronizedWriter >> writeCopyOf: aProvenanceEntityRelation croppingRelationsWith: aBlock readingValues: aChildDelegateLoadingBlock bindingWithCandidates: aBindingBlock [

	self writeLockAccessExpression: [ :expr | 
		aChildDelegateLoadingBlock
			cull: expr
			cull:
			(aProvenanceEntityRelation to relationNamed: #lockAccessExpression) ].
	self setSynchronizedBlock: (aChildDelegateLoadingBlock
			 cull: self
			 cull: (aProvenanceEntityRelation to relationNamed: #block))
]

{ #category : #writing }
MOSynchronizedWriter >> writeLockAccessExpression: aConditionBlock [

	self lockAccessExpression:
		(self writeUnregisteredExpression: aConditionBlock)
]
