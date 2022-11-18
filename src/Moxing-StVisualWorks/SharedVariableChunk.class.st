Class {
	#name : #SharedVariableChunk,
	#superclass : #MessageSendBasedChunk,
	#category : #'Moxing-StVisualWorks-CodeImport'
}

{ #category : #visiting }
SharedVariableChunk >> accept: aVisitor [

	^ aVisitor visitSharedVariableChunk: self
]

{ #category : #generated }
SharedVariableChunk >> initializer [

	^ self at: #initializer or: nil
]

{ #category : #testing }
SharedVariableChunk >> isConstant [

	^ self at: #isConstant or: false
]

{ #category : #visiting }
SharedVariableChunk >> symbolKind [

	^ #SharedVariable
]
