Class {
	#name : #MOModelParametrizableClassBuilder,
	#superclass : #MOModelJavaClassBuilder,
	#instVars : [
		'typeParameters'
	],
	#category : #'Moxing-Language-MicroBuilders-Types'
}

{ #category : #accessing }
MOModelParametrizableClassBuilder >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
]

{ #category : #accessing }
MOModelParametrizableClassBuilder >> buildsType [

	^ MOParametrizableClass
]

{ #category : #accessing }
MOModelParametrizableClassBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self typeParameters: anEntity typeParameters
]

{ #category : #accessing }
MOModelParametrizableClassBuilder >> privateBuild [

	^ super privateBuild
		  typeParameters: self typeParameters;
		  yourself
]

{ #category : #accessing }
MOModelParametrizableClassBuilder >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ] 
]

{ #category : #accessing }
MOModelParametrizableClassBuilder >> typeParameters: anObject [

	typeParameters := anObject
]
