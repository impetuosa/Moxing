"
I write classes allow to include as much as my parent and constructors 
"
Class {
	#name : #MOClassWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOClassWriter >> addAccessor: aMOAccessor [ 
	writeBuilder addAccessor: aMOAccessor 
]

{ #category : #adding }
MOClassWriter >> addConstructor: aMOConstructor [ 
	writeBuilder addConstructor: aMOConstructor 
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

{ #category : #writing }
MOClassWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #class / anEntity name
]

{ #category : #writing }
MOClassWriter >> privateWriteToSurface: anEntity [
	surface addClass: anEntity
]

{ #category : #writing }
MOClassWriter >> superclassReference: superClassReference [

	writeBuilder superclassReference: superClassReference
]

{ #category : #writing }
MOClassWriter >> writeAttributeAccessor: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAccessorWriter
]

{ #category : #writing }
MOClassWriter >> writeFunction: aBlock [

	^ self
		  write: [ :function | 
			  function setDynamicBinding.
			  aBlock value: function ]
		  inSubWriter: MOClassFunctionWriter
]

{ #category : #writing }
MOClassWriter >> writeSubprocedure: aBlock [

	^ self
		  write: [ :function | 
			  function setDynamicBinding.
			  aBlock value: function ]
		  inSubWriter: MOClassSubProcedureWriter
]
