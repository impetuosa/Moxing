Class {
	#name : #MOModelClassTypeBuilder,
	#superclass : #MOModelTypeParameterBuilder,
	#instVars : [
		'imports',
		'modifiers'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelClassTypeBuilder >> addModifier: aString [ 
	self modifiers add: aString 
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> imports [

	^ imports ifNil: [ imports := OrderedCollection new ]
]

{ #category : #generated }
MOModelClassTypeBuilder >> imports: aCollection [

	imports := aCollection
]

{ #category : #accessing }
MOModelClassTypeBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> privateBuild [

	^ (self instantiate: MOClassType)
		  name: self name;
		  modifiers: self modifiers;
		  parent: self packageReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]
