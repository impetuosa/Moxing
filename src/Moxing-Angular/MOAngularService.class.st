Class {
	#name : #MOAngularService,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#name => MOPropertySlot',
		'#behavior => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Declaration'
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
MOAngularService >> isDeclaration [

	^ true
]

{ #category : #accessing }
MOAngularService >> language [
	^ parent language
]

{ #category : #accessing }
MOAngularService >> language: aMOLanguage [ 

]

{ #category : #accessing }
MOAngularService >> name [

	^ name
]

{ #category : #accessing }
MOAngularService >> name: aName [ 
	 name := aName 
	
]

{ #category : #accessing }
MOAngularService >> printOn: aStream [

	aStream
		nextPutAll: 'AngularService: ';
		nextPutAll:self  name
]
