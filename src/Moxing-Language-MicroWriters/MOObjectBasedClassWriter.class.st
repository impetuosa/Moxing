Class {
	#name : #MOObjectBasedClassWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOObjectBasedClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClassWriter: self 


]

{ #category : #adding }
MOObjectBasedClassWriter >> addAttributeAccessor: aMOAccessor [ 
	writeBuilder addAttributeAccessor: aMOAccessor 
]

{ #category : #adding }
MOObjectBasedClassWriter >> addConstructor: aMOConstructor [ 
	writeBuilder addConstructor: aMOConstructor 
]

{ #category : #adding }
MOObjectBasedClassWriter >> addFunction: aMOProcedure [

	self addMethod: aMOProcedure
]

{ #category : #adding }
MOObjectBasedClassWriter >> addProcedure: aMOProcedure [

	self addMethod: aMOProcedure
]

{ #category : #initialization }
MOObjectBasedClassWriter >> initializeWriteBuilder [
	writeBuilder := builder objectBasedClassBuilder
]

{ #category : #writing }
MOObjectBasedClassWriter >> privateWriteToSurface: anEntity [
	surface addClass: anEntity
]

{ #category : #writing }
MOObjectBasedClassWriter >> writeAttributeAccessor: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAttributeAccessorWriter
]

{ #category : #writing }
MOObjectBasedClassWriter >> writeFunction: aBlock [

	^ self
		  write: [ :function | 
			  function setDynamicBinding.
			  aBlock value: function ]
		  inSubWriter: MOFunctionWriter
]

{ #category : #writing }
MOObjectBasedClassWriter >> writeSubprocedure: aBlock [

	^ self
		  write: [ :function | 
			  function setDynamicBinding.
			  aBlock value: function ]
		  inSubWriter: MOSubProcedureWriter
]
