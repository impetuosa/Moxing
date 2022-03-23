Class {
	#name : #MOGlobalVariableWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOGlobalVariableWriter >> initializeWriteBuilder [

	writeBuilder := builder globalVariableBuilder
]

{ #category : #initialization }
MOGlobalVariableWriter >> privateWriteToSurface: anEntity [
	surface addGlobalVariable: anEntity
]
