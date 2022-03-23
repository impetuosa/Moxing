Class {
	#name : #MOModelParametrizableClassBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'typeParameters'
	],
	#category : #'Moxing-MicroBuilders-types'
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
