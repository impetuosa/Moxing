Class {
	#name : #MOAngularClass,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#classRepresentation => MODeclaresSlot one'
	],
	#category : #'Moxing-Angular-Declaration'
}

{ #category : #accessing }
MOAngularClass class >> isRenamable [
	^ false
]

{ #category : #visiting }
MOAngularClass >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitAngularClass: self
]

{ #category : #'as yet unclassified' }
MOAngularClass >> classRepresentation [

	^ classRepresentation 
]

{ #category : #accessing }
MOAngularClass >> classRepresentation: aMOClass [ 
	classRepresentation := aMOClass
]

{ #category : #accessing }
MOAngularClass >> contentReference [ 
	^ self fileReference /self  name , 'ts'
]

{ #category : #generated }
MOAngularClass >> interfaces [
	^ self classRepresentation types 
]

{ #category : #testing }
MOAngularClass >> isDefinedInLibrary [

	^ classRepresentation isDefinedInLibrary
]

{ #category : #accessing }
MOAngularClass >> language [

	^ classRepresentation language
]

{ #category : #accessing }
MOAngularClass >> language: aMOLanguage [ 

]

{ #category : #accessing }
MOAngularClass >> methods [
	^ self classRepresentation methods 
]

{ #category : #accessing }
MOAngularClass >> name [

	^ classRepresentation
		  ifNil: [ 'Error loading' ]
		  ifNotNil: [ :a | a name ]
]

{ #category : #accessing }
MOAngularClass >> parents [

	^ self classRepresentation parents
]

{ #category : #accessing }
MOAngularClass >> printOn: aStream [

	aStream nextPutAll: 'AngularClass(' , self name , ')'
]

{ #category : #accessing }
MOAngularClass >> produceCode [ 
	^ classRepresentation produceCode 
]

{ #category : #accessing }
MOAngularClass >> producesParseableCode [  
	^ classRepresentation producesParseableCode 
]

{ #category : #accessing }
MOAngularClass >> properties [
	^ self classRepresentation properties 
]

{ #category : #accessing }
MOAngularClass >> sourceCode [

	^ self anchor readStream upToEnd
]

{ #category : #accessing }
MOAngularClass >> superclass [
	^ self classRepresentation superclass 
]
