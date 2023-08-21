Class {
	#name : #MOExternalProcedureWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #initialization }
MOExternalProcedureWriter >> initializeWriteBuilder [

	writeBuilder := builder externalProcedureBuilder
]

{ #category : #generated }
MOExternalProcedureWriter >> libraryName: aString [ 
	 writeBuilder libraryName: aString 
]

{ #category : #accessing }
MOExternalProcedureWriter >> librarySelector: aString [ 
	writeBuilder librarySelector: aString 
]

{ #category : #initialization }
MOExternalProcedureWriter >> privateWriteToSurface: anEntity [
	surface addExternalFunction: anEntity
]
