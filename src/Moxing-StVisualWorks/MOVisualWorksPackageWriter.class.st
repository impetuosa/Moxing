Class {
	#name : #MOVisualWorksPackageWriter,
	#superclass : #MOPackageWriter,
	#category : #'Moxing-StVisualWorks-Writer'
}

{ #category : #visiting }
MOVisualWorksPackageWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitPackageWriter: self 


]

{ #category : #adding }
MOVisualWorksPackageWriter >> addPackage: aMOVisualWorksPackage [ 

]

{ #category : #adding }
MOVisualWorksPackageWriter >> addSharedVariable: aMOSharedVariable [

	writeBuilder addSharedVariable: aMOSharedVariable
]

{ #category : #accessing }
MOVisualWorksPackageWriter >> comment: aString [ 
	writeBuilder comment: aString 
]

{ #category : #'as yet unclassified' }
MOVisualWorksPackageWriter >> developmentPrerequisites: aCollection [ 

]

{ #category : #initialization }
MOVisualWorksPackageWriter >> initializeWriteBuilder [

	writeBuilder := builder visualWorksPackageBuilder
]

{ #category : #'as yet unclassified' }
MOVisualWorksPackageWriter >> notice: aString [ 
	
]

{ #category : #accessing }
MOVisualWorksPackageWriter >> packageName: aString [

	writeBuilder name: aString
]

{ #category : #'as yet unclassified' }
MOVisualWorksPackageWriter >> parcelDependancies: aCollection [ 
	writeBuilder parcelDependancies: aCollection 
]

{ #category : #'as yet unclassified' }
MOVisualWorksPackageWriter >> parcelName: aString [ 
	writeBuilder parcelName: aString 
]

{ #category : #'as yet unclassified' }
MOVisualWorksPackageWriter >> prerequisiteDescriptions: aCollection [ 

]

{ #category : #'as yet unclassified' }
MOVisualWorksPackageWriter >> prerequisiteParcels: aCollection [

	self assert: (aCollection allSatisfy: [ :a | a second isEmpty ]).
	self parcelDependancies: (aCollection collect: #first)
]

{ #category : #versions }
MOVisualWorksPackageWriter >> version: aString [ 
	writeBuilder version: aString 
]

{ #category : #versions }
MOVisualWorksPackageWriter >> writeSharedConstant: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOSharedConstantWriter.
	^ stmnt
]

{ #category : #versions }
MOVisualWorksPackageWriter >> writeSharedVariable: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOSharedVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOVisualWorksPackageWriter >> writeStClass: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOStClassWriter
]

{ #category : #writing }
MOVisualWorksPackageWriter >> writeStExensionMethodDeclarationUnit: aFullBlockClosure [ 

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOStExtensionMethodDeclarationUnitWriter 
]

{ #category : #writing }
MOVisualWorksPackageWriter >> writeVisualWorksPackage: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOVisualWorksPackageWriter
]
