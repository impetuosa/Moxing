Class {
	#name : #MOJavaClass,
	#superclass : #MOClass,
	#instVars : [
		'#types => MODeclaresSlot many',
		'#staticInitializer => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOJavaClass >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitJavaClass: self
]

{ #category : #accessing }
MOJavaClass >> staticInitializer [

	^ staticInitializer
]

{ #category : #accessing }
MOJavaClass >> staticInitializer: anObject [

	staticInitializer := anObject
]

{ #category : #accessing }
MOJavaClass >> types [

	^ types
]

{ #category : #accessing }
MOJavaClass >> types: anObject [

	types := anObject
]
