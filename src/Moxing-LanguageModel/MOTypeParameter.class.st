Class {
	#name : #MOTypeParameter,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MOReferenceSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOTypeParameter >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitTypeParameter: self
]

{ #category : #accessing }
MOTypeParameter >> printOn: aStream [

	aStream
		nextPutAll: 'type parameter: ';
		nextPutAll: name
]

{ #category : #accessing }
MOTypeParameter >> superTypeReferences [
	^ superTypeReferences
]

{ #category : #accessing }
MOTypeParameter >> superTypeReferences: aCollection [ 
	superTypeReferences := aCollection
]
