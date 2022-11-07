Class {
	#name : #MOConstructor,
	#superclass : #MOInvocable,
	#instVars : [
		'#thrownTypeReferences => MORefersSlot many',
		'#typeParameters => MODeclaresSlot many',
		'#annotationInstances => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOConstructor >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitConstructor: self
]

{ #category : #accessing }
MOConstructor >> annotationInstances: aCollection [ 
	annotationInstances := aCollection
]

{ #category : #accessing }
MOConstructor >> canBeReferredAsConstructor [
	 ^ true 
]

{ #category : #'as yet unclassified' }
MOConstructor >> constructingTypeName [

	^ self parent name
]

{ #category : #accessing }
MOConstructor >> selector [ 
	^ self parent name 
]

{ #category : #accessing }
MOConstructor >> thrownTypeReferences [
	^ thrownTypeReferences
]

{ #category : #accessing }
MOConstructor >> thrownTypeReferences: aCollection [ 
	thrownTypeReferences := aCollection
]

{ #category : #accessing }
MOConstructor >> typeParameters: aCollection [ 
	typeParameters := aCollection
]
