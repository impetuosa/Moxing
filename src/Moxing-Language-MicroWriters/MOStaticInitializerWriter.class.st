Class {
	#name : #MOStaticInitializerWriter,
	#superclass : #MOInvocableWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #writing }
MOStaticInitializerWriter >> initializeWriteBuilder [

	writeBuilder := builder staticInitializerBuilder
]

{ #category : #writing }
MOStaticInitializerWriter >> privateWriteToSurface: anEntity [

	surface staticInitializer: anEntity
]
