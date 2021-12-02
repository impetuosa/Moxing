Class {
	#name : #MOStatementMethodInvocationWriter,
	#superclass : #MOStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #generated }
MOStatementMethodInvocationWriter >> arguments: aCollection [ 
	writeBuilder arguments: aCollection 
]

{ #category : #writing }
MOStatementMethodInvocationWriter >> initializeWriteBuilder [

	writeBuilder := builder methodInvocationBuilder
]

{ #category : #accessing }
MOStatementMethodInvocationWriter >> receiverReference: aMOVariableReference [ 
	writeBuilder receiverReference: aMOVariableReference  
]

{ #category : #accessing }
MOStatementMethodInvocationWriter >> selector: aString [ 
	writeBuilder selector: aString 
]
