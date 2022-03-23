Class {
	#name : #MOVariableAccessorWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOVariableAccessorWriter >> initializeWriteBuilder [

	writeBuilder := builder variableAccessorBuilder
]

{ #category : #accessing }
MOVariableAccessorWriter >> kind: aString [ 
	writeBuilder kind: aString 
]
