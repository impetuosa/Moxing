Class {
	#name : #MOConstructor,
	#superclass : #MOInvocable,
	#instVars : [
		'type'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOConstructor >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitConstructor: self
]

{ #category : #generated }
MOConstructor >> hierarchicalChildren [

	^ self parameters , self annotations , self typeParameters
	  , { self block }
]

{ #category : #accessing }
MOConstructor >> selector [ 
	^ class name 
]

{ #category : #accessing }
MOConstructor >> type [

	^ type
]

{ #category : #accessing }
MOConstructor >> type: aTypeRefrence [

	type := aTypeRefrence
]
