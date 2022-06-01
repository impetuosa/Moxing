Class {
	#name : #MORootDeclarationWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MORootDeclarationWriter >> initializeWriteBuilder [
	writeBuilder := builder rootDeclarationBuilder. 
]
