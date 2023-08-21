Class {
	#name : #MOLibraryBuilder,
	#superclass : #MOArtefactBuilder,
	#instVars : [
		'invocables',
		'attributes'
	],
	#category : #'Moxing-Language-MicroBuilders-Project'
}

{ #category : #adding }
MOLibraryBuilder >> addAttribute: aMOAttribute [

	self attributes add: aMOAttribute
]

{ #category : #adding }
MOLibraryBuilder >> addFunction: aMOFunction [

	self addInvocable: aMOFunction
]

{ #category : #adding }
MOLibraryBuilder >> addInvocable: aMOFunction [

	self invocables add: aMOFunction
]

{ #category : #accessing }
MOLibraryBuilder >> attributes [

	^ attributes ifNil: [ attributes := OrderedCollection new ]
]

{ #category : #accessing }
MOLibraryBuilder >> invocables [

	^ invocables ifNil: [ invocables := OrderedCollection new ]
]

{ #category : #accessing }
MOLibraryBuilder >> invocables: anObject [

	invocables := anObject
]

{ #category : #accessing }
MOLibraryBuilder >> loadBuilderWithEntity: anEntity [

	self
		types: anEntity types;
		packages: anEntity package;
		declarationUnits: anEntity declarationUnits;
		invocables: anEntity invocables;
		name: anEntity name
]

{ #category : #accessing }
MOLibraryBuilder >> privateBuild [

	^ (self instantiate: MOLibrary)
		  name: self name;
		  types: self types;
		  packages: self packages;
		  declarationUnits: self declarationUnits;
		  invocables: self invocables;
		  attributes: self attributes;
		  yourself
]
