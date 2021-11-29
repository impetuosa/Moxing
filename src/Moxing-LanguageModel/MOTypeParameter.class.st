Class {
	#name : #MOTypeParameter,
	#superclass : #MOType,
	#instVars : [
		'supertypeReferences'
	],
	#category : #'Moxing-LanguageModel-Model'
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
MOTypeParameter >> superTypeReferences: aCollection [ 
	supertypeReferences := aCollection
]

{ #category : #accessing }
MOTypeParameter >> supertypeReferences [
	^ supertypeReferences
]

{ #category : #accessing }
MOTypeParameter >> supertypes: aCollection [ 
	supertypeReferences := aCollection
]
