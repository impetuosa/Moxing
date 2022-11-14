Class {
	#name : #MOAngularModuleWriter,
	#superclass : #MOPackageWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-Angular-Building'
}

{ #category : #visiting }
MOAngularModuleWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAngularModuleWriter: self 


]

{ #category : #adding }
MOAngularModuleWriter >> addAngularComponent: aMOAngularComponent [

	writeBuilder addAngularComponent: aMOAngularComponent
]

{ #category : #writing }
MOAngularModuleWriter >> initializeWriteBuilder [

	writeBuilder := builder angularModuleBuilder
]

{ #category : #writing }
MOAngularModuleWriter >> privateWriteToSurface: anEntity [

	surface addAngularModule: anEntity
]

{ #category : #writing }
MOAngularModuleWriter >> writeAngularComponent: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAngularComponentWriter
]
