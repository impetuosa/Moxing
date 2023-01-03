Class {
	#name : #MOPrimitiveTypeReference,
	#superclass : #MOTypedReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOPrimitiveTypeReference >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitPrimitiveTypeReference: self
]

{ #category : #accessing }
MOPrimitiveTypeReference >> fullName [

	^self  name
]

{ #category : #generated }
MOPrimitiveTypeReference >> isTypeReference [ 
	^ true 
]

{ #category : #testing }
MOPrimitiveTypeReference >> isUnknown [
	^ false 
]

{ #category : #generated }
MOPrimitiveTypeReference >> parent: aParent [
	" dont care about parents "
]

{ #category : #generated }
MOPrimitiveTypeReference >> printOn: aStream [

	aStream
		nextPutAll: 'pt: ';
		nextPutAll: self name
]

{ #category : #'as yet unclassified' }
MOPrimitiveTypeReference >> refersToObjectsLike: aMOPrimitiveType [
	
	^ aMOPrimitiveType canBeReferredAsPrimitiveType
]

{ #category : #generated }
MOPrimitiveTypeReference >> type [ 
	^ referee
]
