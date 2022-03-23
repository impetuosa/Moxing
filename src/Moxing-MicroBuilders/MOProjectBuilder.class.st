Class {
	#name : #MOProjectBuilder,
	#superclass : #MOArtefactBuilder,
	#instVars : [
		'dependencies'
	],
	#category : #'Moxing-MicroBuilders-project'
}

{ #category : #accessing }
MOProjectBuilder >> dependencies [

	^ dependencies ifNil: [ dependencies := OrderedCollection new ]
]

{ #category : #accessing }
MOProjectBuilder >> dependencies: anObject [

	dependencies := anObject
]

{ #category : #accessing }
MOProjectBuilder >> loadBuilderWithEntity: anEntity [

	self
		types: anEntity types;
		packages: anEntity package;
		declarationUnits: anEntity declarationUnits;
		dependencies: anEntity dependencies
]

{ #category : #accessing }
MOProjectBuilder >> privateBuild [

	^ (self instantiate: MOProject)
		  types: self types;
		  packages: self packages;
		  declarationUnits: self declarationUnits;
		  dependencies: self dependencies;
		  yourself
]
