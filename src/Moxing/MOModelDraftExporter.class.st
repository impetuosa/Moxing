Class {
	#name : #MOModelDraftExporter,
	#superclass : #Object,
	#instVars : [
		'destinationDirectory',
		'model'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOModelDraftExporter >> destinationDirectory: aFileReference [ 
	destinationDirectory := aFileReference
]

{ #category : #actions }
MOModelDraftExporter >> export: aMOModelDerivative [

	model := aMOModelDerivative.
	self visitCollection:
		(aMOModelDerivative entityFor: aMOModelDerivative root) packages
]

{ #category : #'as yet unclassified' }
MOModelDraftExporter >> useDirectoryFor: aString during: aFullBlockClosure [

	| prev |
	prev := destinationDirectory.

	destinationDirectory := ('.' split: aString)
		                        inject: destinationDirectory
		                        into: [ :acc :dir | 
		                        (acc / dir) ensureCreateDirectory ].
	^ aFullBlockClosure ensure: [ destinationDirectory := prev ]
]

{ #category : #visiting }
MOModelDraftExporter >> visitCollection: aCollection [

	^ aCollection
		  reject: #isNil
		  thenCollect: [ :a | (model entityFor: a) acceptVisitor: self ]
]

{ #category : #visiting }
MOModelDraftExporter >> visitDeclarationUnit: aMODeclarationUnit [

	| file |
	file := (destinationDirectory / aMODeclarationUnit name
	         , aMODeclarationUnit language extension) ensureCreateFile.
	file writeStream
		nextPutAll: aMODeclarationUnit produceCode;
		close.
	^ file
]

{ #category : #visiting }
MOModelDraftExporter >> visitPackage: aMOPackage [
	^ aMOPackage isDefinedInLibrary ifFalse: [ 
		  self assert: aMOPackage types isEmpty.
		  self
			  useDirectoryFor: aMOPackage name
			  during: [ self visitCollection: aMOPackage declarationUnits ] ]
]
