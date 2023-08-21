"
I write modules allowing to add functions procedures and variables 
"
Class {
	#name : #MOModuleWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOModuleWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitModuleWriter: self 


]

{ #category : #adding }
MOModuleWriter >> addAttribute: aMOAttribute [

	writeBuilder addAttribute: aMOAttribute
]

{ #category : #adding }
MOModuleWriter >> addAttributeAccessor: aMOAccessor [ 
	writeBuilder addAttributeAccessor: aMOAccessor .
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
MOModuleWriter >> addExternalFunction: aMOExternalFunction [ 
	 writeBuilder addExternalFunction: aMOExternalFunction 
]

{ #category : #adding }
MOModuleWriter >> addFunction: aMOFunction [ 
	writeBuilder addFunction: aMOFunction 
]

{ #category : #adding }
MOModuleWriter >> addGlobalConstant: aMOGlobalConstant [ 
	writeBuilder addGlobalConstant: aMOGlobalConstant 
]

{ #category : #adding }
MOModuleWriter >> addGlobalVariable: aMOGlobalVariable [ 
	writeBuilder addGlobalVariable: aMOGlobalVariable 
]

{ #category : #adding }
MOModuleWriter >> addLocalConstant: aMOLocalConstant [ 
	self shouldBeImplemented.
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
MOModuleWriter >> privateWriteToSurface: anEntity [
	surface addModule: anEntity
]

{ #category : #writing }
MOModuleWriter >> writeAttribute: aBlock [

	<doc: 'Writes an attribute within a the context of a module.'>
	^ self writeGlobalVariable: aBlock
]

{ #category : #writing }
MOModuleWriter >> writeAttributeAccessor: aFullBlockClosure [
	<doc: 'Writes an attribute accessor within a the context of a module.'>
	^ self writeVariableAccessor: aFullBlockClosure
]

{ #category : #writing }
MOModuleWriter >> writeConstant: aFullBlockClosure [
	<doc: 'Writes an constant within a the context of a module.'>
	^ self writeGlobalConstant: aFullBlockClosure
]

{ #category : #writing }
MOModuleWriter >> writeExternalFunction: aFullBlockClosure [

	<doc: 'Writes an external function within a the context of a module.'>
	^ self write: aFullBlockClosure inSubWriter: MOExternalFunctionWriter
]

{ #category : #writing }
MOModuleWriter >> writeExternalProcedure: aFullBlockClosure [
	<doc: 'Writes an external procedure within a the context of a module.'>
	^ self write: aFullBlockClosure inSubWriter: MOExternalProcedureWriter
]

{ #category : #writing }
MOModuleWriter >> writeFunction: aBlock [
	<doc: 'Writes a function within a the context of a module.'>
	^ self write: aBlock inSubWriter: MOFunctionWriter
]

{ #category : #writing }
MOModuleWriter >> writeGlobalConstant: aFullBlockClosure [ 
	<doc: 'Writes a golboal constant within a the context of a module.'>
	| stmnt |

	stmnt := self write: aFullBlockClosure inSubWriter: MOGlobalConstantWriter.
	^ stmnt
]

{ #category : #writing }
MOModuleWriter >> writeGlobalVariable: aBlock [
	<doc: 'Writes a global variable within a the context of a module.'>
	^ self write: aBlock inSubWriter: MOGlobalVariableWriter 
]

{ #category : #writing }
MOModuleWriter >> writeLocalConstant: aBlock [
	<doc: 'Writes a local constant within a the context of a module.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOLocalConstantWriter.
	^ stmnt
]

{ #category : #writing }
MOModuleWriter >> writeStructure: aBlock [
	<doc: 'Writes a strcuture within a the context of a module.'>
	^ self write: aBlock inSubWriter: MOStructureWriter
]

{ #category : #writing }
MOModuleWriter >> writeSubprocedure: aBlock [
	<doc: 'Writes a subprocedure within a the context of a module.'>
	^ self write: aBlock inSubWriter: MOSubProcedureWriter
]

{ #category : #writing }
MOModuleWriter >> writeVariableAccessor: aFullBlockClosure [

	<doc: 'Writes a variable accessor  within a the context of a module.'>
	^ self write: aFullBlockClosure inSubWriter: MOVariableAccessorWriter
]
