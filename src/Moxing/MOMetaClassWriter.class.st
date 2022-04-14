Class {
	#name : #MOMetaClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOMetaClassWriter >> initializeWriteBuilder [

	writeBuilder := builder metaclassBuilder
]

{ #category : #writing }
MOMetaClassWriter >> writeStMethod: aFullBlockClosure [ 
	^ self write: aFullBlockClosure inSubWriter: MOStMethodWriter
]
