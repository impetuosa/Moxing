Class {
	#name : #MOImportWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOImportWriter >> file: aString [ 
	writeBuilder file: aString 
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

	surface addImport: anEntity.
	anEntity parent: surface
]
