"
I write classes allow to include as much as my parent and constructors 
"
Class {
	#name : #MOClassWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClassWriter: self 


]

{ #category : #adding }
MOClassWriter >> addAttributeAccessor: aMOAccessor [ 
	writeBuilder addAttributeAccessor: aMOAccessor 
]

{ #category : #adding }
MOClassWriter >> addConstantAttribute: aMOConstantAttribute [

	writeBuilder addConstantAttribute: aMOConstantAttribute
]

{ #category : #adding }
MOClassWriter >> addConstructor: aMOConstructor [ 
	writeBuilder addConstructor: aMOConstructor 
]

{ #category : #adding }
MOClassWriter >> addEvent: aMOEvent [ 
	writeBuilder addEvent: aMOEvent 
]

{ #category : #adding }
MOClassWriter >> addExternalFunction: aMOExternalFunction [

	self addMethod: aMOExternalFunction
]

{ #category : #adding }
MOClassWriter >> addFunction: aMOProcedure [

	self addMethod: aMOProcedure
]

{ #category : #adding }
MOClassWriter >> addProcedure: aMOProcedure [

	self addMethod: aMOProcedure
]

{ #category : #initialization }
MOClassWriter >> initializeWriteBuilder [
	writeBuilder := builder classBuilder
]

{ #category : #accessing }
MOClassWriter >> methods [

	^ writeBuilder methods
]

{ #category : #writing }
MOClassWriter >> privateWriteToSurface: anEntity [
	surface addClass: anEntity
]

{ #category : #accessing }
MOClassWriter >> superclassReference [

	^ writeBuilder superclassReference
]

{ #category : #writing }
MOClassWriter >> superclassReference: superClassReference [

	writeBuilder superclassReference: superClassReference
]

{ #category : #writing }
MOClassWriter >> writeAttributeAccessor: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAttributeAccessorWriter
]

{ #category : #writing }
MOClassWriter >> writeClassFunction: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOClassFunctionWriter
]

{ #category : #writing }
MOClassWriter >> writeClassProcedure: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOClassSubProcedureWriter
]

{ #category : #writing }
MOClassWriter >> writeConstant: aFullBlockClosure [

	^ self writeConstantAttribute: aFullBlockClosure
]

{ #category : #writing }
MOClassWriter >> writeConstantAttribute: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOConstantAttributeWriter
]

{ #category : #writing }
MOClassWriter >> writeEvent: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOEventWriter
]

{ #category : #writing }
MOClassWriter >> writeExternalFunction: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOExternalFunctionWriter
]

{ #category : #writing }
MOClassWriter >> writeExternalProcedure: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOExternalProcedureWriter
]

{ #category : #writing }
MOClassWriter >> writeFunction: aFullBlockClosure [

	^ self writeClassFunction: aFullBlockClosure
]

{ #category : #writing }
MOClassWriter >> writeJavaClass: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MOClassWriter >> writeStMethod: aFullBlockClosure [ 
	^ self write: aFullBlockClosure inSubWriter: MOStMethodWriter
]

{ #category : #writing }
MOClassWriter >> writeSubprocedure: aBlock [

	^ self
		  write: [ :function | 
			  function setDynamicBinding.
			  aBlock value: function ]
		  inSubWriter: MOClassSubProcedureWriter
]
