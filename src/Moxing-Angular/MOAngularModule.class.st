Class {
	#name : #MOAngularModule,
	#superclass : #MOPackage,
	#instVars : [
		'#moduleClass => MOContainmentSlot one'
	],
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

	^self  name endsWith: '-routing'
]

{ #category : #'as yet unclassified' }
MOAngularModule >> moduleClass [

	^ moduleClass
]

{ #category : #'as yet unclassified' }
MOAngularModule >> moduleClass: aClass [

	moduleClass := aClass
]

{ #category : #'as yet unclassified' }
MOAngularModule >> printOn: aStream [

	aStream
		nextPutAll: 'AngularModule: ';
		nextPutAll:self  name
]
