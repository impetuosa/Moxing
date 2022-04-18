Class {
	#name : #MOStExtensionMethodDeclarationUnitWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#instVars : [
		'addingMethods'
	],
	#category : #'Moxing-Smalltalk-writer'
}

{ #category : #adding }
MOStExtensionMethodDeclarationUnitWriter >> addMethod: aMOStMethod [
	 addingMethods = #Methods ifTrue: [
	  ^ writeBuilder addExtensionMethod: aMOStMethod.
		
	].
    addingMethods = #ClassMethods ifTrue: [
	  ^ writeBuilder addExtensionClassMethod: aMOStMethod.
	].
self error:' The writer must be informed about what kind of method is to be added'
]

{ #category : #'as yet unclassified' }
MOStExtensionMethodDeclarationUnitWriter >> classReference: aMOTypeReference [ 
	writeBuilder classReference: aMOTypeReference 
]

{ #category : #initialization }
MOStExtensionMethodDeclarationUnitWriter >> initializeWriteBuilder [ 
	writeBuilder := builder stExensionMethodDeclarationUnitBuilder
]

{ #category : #writing }
MOStExtensionMethodDeclarationUnitWriter >> installCopyingBuilder [

	copyHelper := writeBuilder  modelCopyHelper.

	
]

{ #category : #writing }
MOStExtensionMethodDeclarationUnitWriter >> name: aString [ 
	writeBuilder name: aString 
	
]

{ #category : #writing }
MOStExtensionMethodDeclarationUnitWriter >> packageReference: aReference [ 
	 writeBuilder packageReference: aReference 
]

{ #category : #writing }
MOStExtensionMethodDeclarationUnitWriter >> privateWriteToSurface: anEntity [

	surface addDeclarationUnit: anEntity 
	
]

{ #category : #initialization }
MOStExtensionMethodDeclarationUnitWriter >> setAsAddingClassMethods [
	addingMethods := #ClassMethods
]

{ #category : #initialization }
MOStExtensionMethodDeclarationUnitWriter >> setAsAddingMethods [
	addingMethods := #Methods.
]

{ #category : #writing }
MOStExtensionMethodDeclarationUnitWriter >> writeStMethod: aFullBlockClosure [ 
	^ self write: aFullBlockClosure inSubWriter: MOStMethodWriter
]
