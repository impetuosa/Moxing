Class {
	#name : #MOPrimitiveTypeReference,
	#superclass : #MOTypedReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOPrimitiveTypeReference >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitPrimitiveTypeReference: self
]

{ #category : #accessing }
MOPrimitiveTypeReference >> fullName [

	^ name
]

{ #category : #generated }
MOPrimitiveTypeReference >> isTypeReference [ 
	^ true 
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

{ #category : #generated }
MOPrimitiveTypeReference >> type [ 
	^ candidate
]
