"
I write modules allowing to add functions procedures and variables 
"
Class {
	#name : #MOModuleWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOModuleWriter >> addAccessor: aMOAccessor [ 
	writeBuilder addAccessor: aMOAccessor .
]

{ #category : #adding }
MOModuleWriter >> addAttribute: aMOAttribute [

	writeBuilder addAttribute: aMOAttribute
]

{ #category : #adding }
MOModuleWriter >> addConstant: aMOConstant [ 
	writeBuilder addConstant: aMOConstant 
]

{ #category : #adding }
MOModuleWriter >> addEnum: aMOEnum [

	writeBuilder addType: aMOEnum
]

{ #category : #adding }
MOModuleWriter >> addFunction: aMOFunction [ 
	writeBuilder addFunction: aMOFunction 
]

{ #category : #adding }
MOModuleWriter >> addProcedure: aMOProcedure [ 
	writeBuilder addProcedure: aMOProcedure 
]

{ #category : #adding }
MOModuleWriter >> addStructureType: aMOStructure [ 
	writeBuilder addStructureType: aMOStructure 
]

{ #category : #writing }
MOModuleWriter >> initializeWriteBuilder [
	writeBuilder := builder moduleBuilder 
]

{ #category : #accessing }
MOModuleWriter >> name: aString [ 
	writeBuilder name: aString
]

{ #category : #writing }
MOModuleWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #module / anEntity name
]

{ #category : #writing }
MOModuleWriter >> privateWriteToSurface: anEntity [
	surface addModule: anEntity
]

{ #category : #writing }
MOModuleWriter >> writeAttribute: aBlock [
	^ self write: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOModuleWriter >> writeAttributeAccessor: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAccessorWriter
]

{ #category : #writing }
MOModuleWriter >> writeConstant: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOConstantWriter.
	^ stmnt
]

{ #category : #writing }
MOModuleWriter >> writeFunction: aBlock [

	^ self write: aBlock inSubWriter: MOFunctionWriter
]

{ #category : #writing }
MOModuleWriter >> writeStructure: aBlock [

	^ self write: aBlock inSubWriter: MOStructureWriter
]

{ #category : #writing }
MOModuleWriter >> writeSubprocedure: aBlock [

	^ self write: aBlock inSubWriter: MOSubProcedureWriter
]

{ #category : #writing }
MOModuleWriter >> writeVariable: aBlock [

	^ self write: aBlock inSubWriter: MOVariableWriter
]
