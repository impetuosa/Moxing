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
MOTypeParameter >> fullName [

	^ (parent name ifNotNil: [ :str | str , '.' ] ifNil: [ '' ])
	  , self name
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

{ #category : #accessing }
MOTypeParameter >> supertypes: aCollection [ 
	superTypeReferences := aCollection
]
