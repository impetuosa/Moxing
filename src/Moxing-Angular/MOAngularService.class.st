Class {
	#name : #MOAngularService,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#behavior => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularService >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitAngularService: self
]

{ #category : #accessing }
MOAngularService >> behavior [
	^ behavior
]

{ #category : #accessing }
MOAngularService >> behavior: aMOAngularClass [ 
	behavior := aMOAngularClass
]

{ #category : #accessing }
MOAngularService >> printOn: aStream [

	aStream
		nextPutAll: 'AngularService: ';
		nextPutAll: name
]
