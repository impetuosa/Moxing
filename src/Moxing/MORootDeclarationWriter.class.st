Class {
	#name : #MORootDeclarationWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MORootDeclarationWriter >> addPackage: aMOPackage [

	^ writeBuilder addPackage: aMOPackage
]

{ #category : #writing }
MORootDeclarationWriter >> initializeWriteBuilder [
	writeBuilder := builder rootDeclarationBuilder. 
]

{ #category : #writing }
MORootDeclarationWriter >> writePackage: aBlock [

	^ self write: aBlock inSubWriter: MOPackageWriter
]
