Class {
	#name : #MOFunctionWriter,
	#superclass : #MOSubProcedureWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOFunctionWriter >> selector: aSelector [
 	writeBuilder selector: aSelector
]

{ #category : #writing }
MOFunctionWriter >> writeBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOFunctionWriter >> writeParameter: aBlock [

	^ self preWrite: aBlock inSubWriter: MOParameterWriter
]
