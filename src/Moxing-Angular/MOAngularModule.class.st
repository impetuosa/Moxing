Class {
	#name : #MOAngularModule,
	#superclass : #MOPackage,
	#category : #'Moxing-Angular-Model'
}

{ #category : #accessing }
MOAngularModule >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitAngularModule: self
]

{ #category : #accessing }
MOAngularModule >> artefacts [

	^ types
]

{ #category : #accessing }
MOAngularModule >> artefacts: cs [

	types := cs
]

{ #category : #testing }
MOAngularModule >> isRootingModule [

	^ name endsWith: '-routing'
]

{ #category : #'as yet unclassified' }
MOAngularModule >> printOn: aStream [

	aStream
		nextPutAll: 'AngularModule: ';
		nextPutAll: name
]
