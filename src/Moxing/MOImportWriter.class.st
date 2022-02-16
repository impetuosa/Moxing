"
I write imports. 
"
Class {
	#name : #MOImportWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOImportWriter >> importAllTypesOnPackage: aString [

	writeBuilder importAllTypesOnPackage: aString
]

{ #category : #accessing }
MOImportWriter >> importTypeName: aString [

	self importingTypeReference: (self typeReferenceNamed: aString)
]

{ #category : #accessing }
MOImportWriter >> importingPackageReference: aMOPackageReference [ 
	writeBuilder packageReference: aMOPackageReference 
]

{ #category : #accessing }
MOImportWriter >> importingTypeReference: aTypeReference [

	writeBuilder typeReference: aTypeReference
]

{ #category : #writing }
MOImportWriter >> initializeWriteBuilder [

	writeBuilder := builder importBuilder
]

{ #category : #accessing }
MOImportWriter >> packageName: aString [

	self importingPackageReference: (self packageReferenceNamed: aString)
]

{ #category : #accessing }
MOImportWriter >> packageReference: aMOPackageReference [ 
	builder packageReference: aMOPackageReference 
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
