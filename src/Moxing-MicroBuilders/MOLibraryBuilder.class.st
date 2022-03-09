Class {
	#name : #MOLibraryBuilder,
	#superclass : #MOArtefactBuilder,
	#instVars : [
		'invocables',
		'attributes'
	],
	#category : #'Moxing-MicroBuilders-project'
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
		invocables: anEntity invocables
]

{ #category : #accessing }
MOLibraryBuilder >> privateBuild [

	^ (self instantiate: MOLibrary)
		  types: self types;
		  packages: self packages;
		  declarationUnits: self declarationUnits;
		  invocables: self invocables;
		  attributes: self attributes;
		  yourself
]
