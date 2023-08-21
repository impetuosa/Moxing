Class {
	#name : #MOExternalFunctionWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #initialization }
MOExternalFunctionWriter >> initializeWriteBuilder [

	writeBuilder := builder externalFunctionBuilder
]

{ #category : #generated }
MOExternalFunctionWriter >> libraryName: aString [ 
	 writeBuilder libraryName: aString 
]

{ #category : #accessing }
MOExternalFunctionWriter >> librarySelector: aString [ 
	writeBuilder librarySelector: aString 
]

{ #category : #initialization }
MOExternalFunctionWriter >> privateWriteToSurface: anEntity [
	surface addExternalFunction: anEntity
]
