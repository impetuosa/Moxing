Class {
	#name : #MOMetaClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOMetaClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClassWriter: self 


]

{ #category : #initialization }
MOMetaClassWriter >> initializeWriteBuilder [

	writeBuilder := builder metaclassBuilder
]

{ #category : #writing }
MOMetaClassWriter >> writeStMethod: aFullBlockClosure [ 
	^ self write: aFullBlockClosure inSubWriter: MOStMethodWriter
]
