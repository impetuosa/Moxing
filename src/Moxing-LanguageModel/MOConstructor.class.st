Class {
	#name : #MOConstructor,
	#superclass : #MOInvocable,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOConstructor >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitConstructor: self
]

{ #category : #'as yet unclassified' }
MOConstructor >> constructingTypeName [

	^ parent name
]

{ #category : #accessing }
MOConstructor >> selector [ 
	^ parent name 
]
