Class {
	#name : #MOImportWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOImportWriter >> file: aString [ 
	writeBuilder file: aString 
]

{ #category : #'as yet unclassified' }
MOImportWriter >> importAllTypesOnPackage: aString [

	writeBuilder importAllTypesOnPackage: aString
]

{ #category : #accessing }
MOImportWriter >> importTypeName: aString [ 
	writeBuilder importTypeName: aString 
]

{ #category : #writing }
MOImportWriter >> initializeWriteBuilder [

	writeBuilder := builder importBuilder
]

{ #category : #writing }
MOImportWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #import / anEntity name
]

{ #category : #writing }
MOImportWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addImport: anEntity
]
