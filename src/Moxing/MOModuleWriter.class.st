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
MOModuleWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #module / anEntity name
]

{ #category : #writing }
MOModuleWriter >> privateWriteToSurface: anEntity [
	surface addModule: anEntity
]

{ #category : #writing }
MOModuleWriter >> writeAttribute: aBlock [

	^ self writeGlobalVariable: aBlock
]

{ #category : #writing }
MOModuleWriter >> writeAttributeAccessor: aFullBlockClosure [

	^ self writeVariableAccessor: aFullBlockClosure
]

{ #category : #writing }
MOModuleWriter >> writeConstant: aFullBlockClosure [

	^ self writeGlobalConstant: aFullBlockClosure
]

{ #category : #writing }
MOModuleWriter >> writeFunction: aBlock [

	^ self write: aBlock inSubWriter: MOFunctionWriter
]

{ #category : #writing }
MOModuleWriter >> writeGlobalConstant: aFullBlockClosure [ 

	| stmnt |

	stmnt := self write: aFullBlockClosure inSubWriter: MOGlobalConstantWriter.
	^ stmnt
]

{ #category : #writing }
MOModuleWriter >> writeGlobalVariable: aBlock [
	^ self write: aBlock inSubWriter: MOGlobalVariableWriter 
]

{ #category : #writing }
MOModuleWriter >> writeLocalConstant: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOLocalConstantWriter.
	^ stmnt
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
MOModuleWriter >> writeVariableAccessor: aFullBlockClosure [
	^ self write: aFullBlockClosure inSubWriter: MOVariableAccessorWriter
]
