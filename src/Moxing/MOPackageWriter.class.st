Class {
	#name : #MOPackageWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOPackageWriter >> initializeWriteBuilder [

	writeBuilder := builder packageBuilder
]

{ #category : #accessing }
MOPackageWriter >> name: aString [ 
	writeBuilder name: aString
]

{ #category : #writing }
MOPackageWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #package / anEntity name
]

{ #category : #writing }
MOPackageWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addPackage: anEntity
]

{ #category : #writing }
MOPackageWriter >> writeClass: aBlock [

	self preWrite: aBlock inSubWriter: MOClassWriter
]

{ #category : #writing }
MOPackageWriter >> writePackage: aBlock [

	self preWrite: aBlock inSubWriter: MOPackageWriter
]
