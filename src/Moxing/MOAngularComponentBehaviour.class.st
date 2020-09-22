Class {
	#name : #MOAngularComponentBehaviour,
	#superclass : #MOAngularNamedObject,
	#instVars : [
		'classRepresentation'
	],
	#category : #'Moxing-Model'
}

{ #category : #visiting }
MOAngularComponentBehaviour >> acceptVisitor: aJinInspectorBuilder [

	aJinInspectorBuilder visitAngularComponentBehavior: self
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviour >> classRepresentation [

	^ classRepresentation ifNil: [ 
		  classRepresentation := MOTypescriptClassLoader 
			                         loadClassFromFile: path ]
]

{ #category : #generated }
MOAngularComponentBehaviour >> interfaces [
	^ self classRepresentation types 
]

{ #category : #accessing }
MOAngularComponentBehaviour >> methods [
	^ self classRepresentation methods 
]

{ #category : #accessing }
MOAngularComponentBehaviour >> name [
	^ 'Behavior'
]

{ #category : #accessing }
MOAngularComponentBehaviour >> parents [

	^ self classRepresentation parents
]

{ #category : #accessing }
MOAngularComponentBehaviour >> properties [
	^ self classRepresentation properties 
]

{ #category : #accessing }
MOAngularComponentBehaviour >> sourceCode [
	^ path readStream upToEnd 
]

{ #category : #accessing }
MOAngularComponentBehaviour >> superclass [
	^ self classRepresentation superclass 
]
