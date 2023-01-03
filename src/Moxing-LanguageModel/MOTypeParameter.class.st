Class {
	#name : #MOTypeParameter,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOTypeParameter >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitTypeParameter: self
]

{ #category : #accessing }
MOTypeParameter >> methods [

	^ {  }
]

{ #category : #accessing }
MOTypeParameter >> printOn: aStream [

	aStream
		nextPutAll: 'type parameter: ';
		nextPutAll:self  name
]

{ #category : #accessing }
MOTypeParameter >> superTypeReferences [
	^ superTypeReferences
]

{ #category : #accessing }
MOTypeParameter >> superTypeReferences: aCollection [ 
	superTypeReferences := aCollection
]
