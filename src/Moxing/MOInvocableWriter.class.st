Class {
	#name : #MOInvocableWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOInvocableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitInvocableWriter: self 


]

{ #category : #adding }
MOInvocableWriter >> addModifier: aString [ 
	writeBuilder addModifier: aString 
]

{ #category : #adding }
MOInvocableWriter >> addParameter: aMOParameter [

	writeBuilder addParameter: aMOParameter
]

{ #category : #generated }
MOInvocableWriter >> block: aMOBlock [

	writeBuilder block: aMOBlock
]

{ #category : #generated }
MOInvocableWriter >> modifiers: aCollection [ 
	writeBuilder modifiers: aCollection 
]

{ #category : #generated }
MOInvocableWriter >> parameters [
	^ writeBuilder parameters
]

{ #category : #accessing }
MOInvocableWriter >> visibility: aString [ 
	writeBuilder visibility: aString 
]

{ #category : #writing }
MOInvocableWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOInvocableWriter >> writeParameter: aBlock [

	^ self write: aBlock inSubWriter: MOParameterWriter
]
