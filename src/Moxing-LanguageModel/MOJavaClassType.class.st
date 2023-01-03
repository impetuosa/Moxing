Class {
	#name : #MOJavaClassType,
	#superclass : #MOClassType,
	#instVars : [
		'#types => MODeclaresSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOJavaClassType >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitJavaClassType: self
]

{ #category : #accessing }
MOJavaClassType >> types [

	^ types
]

{ #category : #accessing }
MOJavaClassType >> types: anObject [

	types := anObject
]
