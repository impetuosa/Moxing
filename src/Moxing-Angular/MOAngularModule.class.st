Class {
	#name : #MOAngularModule,
	#superclass : #MOAngularEntry,
	#instVars : [
		'artefacts'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #accessing }
MOAngularModule >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularModule: self 
]

{ #category : #accessing }
MOAngularModule >> artefacts [

	^ artefacts
]

{ #category : #accessing }
MOAngularModule >> artefacts: cs [

	artefacts := cs
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

{ #category : #'as yet unclassified' }
MOAngularModule >> save [
	(artefacts noneSatisfy: [ :c | c mustBeSaved ])
		ifTrue: [ ^ self ].
	(artefacts select: [ :c | c mustBeSaved ] )do: [ :c | c save ].
	self typescriptModel 
]

{ #category : #'as yet unclassified' }
MOAngularModule >> typescriptModel [
	^ MOTypescriptClassLoader
		loadClassFromFile: (self anchor / name , 'module' , 'ts')
]
