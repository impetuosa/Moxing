Class {
	#name : #MOSubProcedureWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOSubProcedureWriter >> selector: aSelector [
 	writeBuilder selector: aSelector
]

{ #category : #writing }
MOSubProcedureWriter >> writeBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOSubProcedureWriter >> writeParameter: aBlock [

	^ self preWrite: aBlock inSubWriter: MOParameterWriter
]
