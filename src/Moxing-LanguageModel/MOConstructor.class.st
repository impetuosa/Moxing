Class {
	#name : #MOConstructor,
	#superclass : #MOInvocable,
	#instVars : [
		'#thrownTypeReferences => MOReferenceSlot many',
		'#typeParameters => MOContainmentSlot many',
		'#annotationInstances => MOReferenceSlot many'
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

{ #category : #'as yet unclassified' }
MOConstructor >> constructingTypeName [

	^ parent name
]

{ #category : #accessing }
MOConstructor >> selector [ 
	^ parent name 
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
