Class {
	#name : #MOModelClassTypeBuilder,
	#superclass : #MOModelTypeParameterBuilder,
	#instVars : [
		'packageRefrence',
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

{ #category : #accessing }
MOModelClassTypeBuilder >> package: aMOPackage [

	self packageReference: (self packageReferenceBuilder
			 package: aMOPackage;
			 build)
]

{ #category : #accessing }
MOModelClassTypeBuilder >> packageReference [

	^ packageRefrence 
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> packageReference: aMOPackageReference [

	packageRefrence := aMOPackageReference
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> privateBuild [

	^ (self instantiate: MOClassType)
		  name: self name;
		  parent: self parent; 
		  modifiers: self modifiers;
		  parent: self packageReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]
