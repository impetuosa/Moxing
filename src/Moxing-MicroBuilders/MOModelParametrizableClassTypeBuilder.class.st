Class {
	#name : #MOModelParametrizableClassTypeBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#instVars : [
		'typeParameters'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #accessing }
MOModelParametrizableClassTypeBuilder >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
]

{ #category : #accessing }
MOModelParametrizableClassTypeBuilder >> buildsType [ 
	^ MOParametrizableClassType 
]

{ #category : #accessing }
MOModelParametrizableClassTypeBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self typeParameters: anEntity typeParameters
]

{ #category : #accessing }
MOModelParametrizableClassTypeBuilder >> privateBuild [

	^ super privateBuild
		  typeParameters: self typeParameters;
		  yourself
]

{ #category : #adding }
MOModelParametrizableClassTypeBuilder >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ] 
]

{ #category : #accessing }
MOModelParametrizableClassTypeBuilder >> typeParameters: anObject [

	typeParameters := anObject
]
