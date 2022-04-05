Class {
	#name : #MOMetaClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOMetaClassWriter >> initializeWriteBuilder [

	writeBuilder := builder metaclassBuilder
]
