Class {
	#name : #MOFileImportWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOFileImportWriter >> addImportingTypeName: aName [

	writeBuilder addReference: (self typeReferenceNamed: aName)
]

{ #category : #accessing }
MOFileImportWriter >> file: aString [ 
	writeBuilder file: aString 
]

{ #category : #writing }
MOFileImportWriter >> initializeWriteBuilder [

	writeBuilder := builder fileImportBuilder
]

{ #category : #accessing }
MOFileImportWriter >> packageName: aString [

	self importingPackageReference: (self packageReferenceNamed: aString)
]

{ #category : #accessing }
MOFileImportWriter >> packageReference: aMOPackageReference [ 
	builder packageReference: aMOPackageReference 
]

{ #category : #writing }
MOFileImportWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #import / anEntity name
]

{ #category : #writing }
MOFileImportWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addImport: anEntity
]
