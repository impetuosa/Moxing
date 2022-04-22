Class {
	#name : #MOLibraryWriter,
	#superclass : #MOArtefactWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOLibraryWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitLibraryWriter: self 


]

{ #category : #adding }
MOLibraryWriter >> addAttribute: aMOAttribute [ 
	writeBuilder addAttribute: aMOAttribute 
]

{ #category : #adding }
MOLibraryWriter >> addFunction: aMOFunction [

	writeBuilder addFunction: aMOFunction
]

{ #category : #adding }
MOLibraryWriter >> initializeWriteBuilder [

	writeBuilder := builder libraryBuilder
]

{ #category : #writing }
MOLibraryWriter >> writeAttribute: aBlock [
	^ self write: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOLibraryWriter >> writeEnum: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOEnumWriter
]

{ #category : #writing }
MOLibraryWriter >> writeFunction: aBlock [

	^ self
		  write: [ :function | 
			  function setStaticBinding.
			  aBlock value: function ]
		  inSubWriter: MOFunctionWriter
]
