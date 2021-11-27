Class {
	#name : #MOModuleWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOModuleWriter >> initializeWriteBuilder [
	writeBuilder := builder moduleBuilder 
]

{ #category : #writing }
MOModuleWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #module / anEntity name
]

{ #category : #writing }
MOModuleWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addModule: anEntity
]

{ #category : #writing }
MOModuleWriter >> writeFunction: aBlock [ 
	self preWrite: aBlock inSubWriter: MOFunctionWriter 
]

{ #category : #writing }
MOModuleWriter >> writeSubprocedure: aBlock [

	self preWrite: aBlock inSubWriter: MOSubProcedureWriter
]

{ #category : #writing }
MOModuleWriter >> writeVariable: aBlock [

	self preWrite: aBlock inSubWriter: MOVariableWriter
]
