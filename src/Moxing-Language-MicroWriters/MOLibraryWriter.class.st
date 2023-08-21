Class {
	#name : #MOLibraryWriter,
	#superclass : #MOArtefactWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
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
	<doc: 'Writes an attribute within a Library.'>
	^ self write: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOLibraryWriter >> writeEnum: aFullBlockClosure [
	<doc: 'Writes an enum within a Library.'>
	^ self write: aFullBlockClosure inSubWriter: MOEnumWriter
]

{ #category : #writing }
MOLibraryWriter >> writeFunction: aBlock [
	<doc: 'Writes an function within a Library.'>
	^ self
		  write: [ :function | 
			  function setStaticBinding.
			  aBlock value: function ]
		  inSubWriter: MOFunctionWriter
]
