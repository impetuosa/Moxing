Class {
	#name : #MOClassFunctionWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOClassFunctionWriter >> initializeWriteBuilder [

	writeBuilder := builder classFunctionBuilder
]
