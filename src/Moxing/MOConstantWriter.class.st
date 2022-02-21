Class {
	#name : #MOConstantWriter,
	#superclass : #MOVariableWriter,
	#instVars : [
		'value'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #generated }
MOConstantWriter >> initializeWriteBuilder [

	writeBuilder := builder constantBuilder
]

{ #category : #generated }
MOConstantWriter >> privateWriteToSurface: anEntity [
	surface addConstant: anEntity
]

{ #category : #generated }
MOConstantWriter >> value: aValue [ 
	value := aValue 
]
