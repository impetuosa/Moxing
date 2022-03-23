Class {
	#name : #MOAngularClass,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'classRepresentation'
	],
	#category : #'Moxing-Angular-Model'
}

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
	^ fileReference / name , 'ts'
]

{ #category : #generated }
MOAngularClass >> interfaces [
	^ self classRepresentation types 
]

{ #category : #accessing }
MOAngularClass >> methods [
	^ self classRepresentation methods 
]

{ #category : #accessing }
MOAngularClass >> name [
	^ 'Behavior'
]

{ #category : #accessing }
MOAngularClass >> parents [

	^ self classRepresentation parents
]

{ #category : #accessing }
MOAngularClass >> printOn: aStream [

	aStream nextPutAll: 'AngularClass(' , name , ')'
]

{ #category : #accessing }
MOAngularClass >> properties [
	^ self classRepresentation properties 
]

{ #category : #accessing }
MOAngularClass >> sourceCode [
	^ anchor readStream upToEnd 
]

{ #category : #accessing }
MOAngularClass >> superclass [
	^ self classRepresentation superclass 
]
