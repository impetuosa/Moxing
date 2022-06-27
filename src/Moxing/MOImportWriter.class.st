"
I write imports. 
"
Class {
	#name : #MOImportWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOImportWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitImportWriter: self 


]

{ #category : #'as yet unclassified' }
MOImportWriter >> importAllTypesOnPackage: aString [

	writeBuilder importAllTypesOnPackage: aString
]

{ #category : #accessing }
MOImportWriter >> importType: aMOClassType [ 
	writeBuilder importType: aMOClassType 
]

{ #category : #accessing }
MOImportWriter >> importTypeName: aString [

	self importingTypeReference: (self typeReferenceNamed: aString)
]

{ #category : #accessing }
MOImportWriter >> importingPackageReference: aMOPackageReference [ 
	writeBuilder packageReference: aMOPackageReference 
]

{ #category : #'as yet unclassified' }
MOImportWriter >> importingTypeOrTypeReference: type [

	^ type isReference
		  ifTrue: [ self importingTypeReference: type ]
		  ifFalse: [ self importType: type ]
]

{ #category : #accessing }
MOImportWriter >> importingTypeReference: aTypeReference [

	writeBuilder importTypeReference: aTypeReference
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
	surface addImport: anEntity
]
