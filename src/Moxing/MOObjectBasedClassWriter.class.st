Class {
	#name : #MOObjectBasedClassWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOObjectBasedClassWriter >> addAccessor: aMOAccessor [ 
	writeBuilder addAccessor: aMOAccessor 
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
MOObjectBasedClassWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #class / anEntity name
]

{ #category : #writing }
MOObjectBasedClassWriter >> privateWriteToSurface: anEntity [
	surface addClass: anEntity
]

{ #category : #writing }
MOObjectBasedClassWriter >> writeAttributeAccessor: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAccessorWriter
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
