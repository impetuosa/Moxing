"
I build methods
"
Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#instVars : [
		'thrownTypeReferences'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> buildsType [

	<generated>
	^ MOMethod
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self thrownTypeReferences: anEntity thrownTypeReferences
]

{ #category : #accessing }
MOModelMethodBuilder >> privateBuild [

	"self assert: self returnTypeReference isNotNil."

	^ super privateBuild
		  thrownTypeReferences: self thrownTypeReferences;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> setDefaultBinding [

	self setDynamicBinding
]

{ #category : #accessing }
MOModelMethodBuilder >> thrownTypeReferences [

	^ thrownTypeReferences ifNil: [ 
		  thrownTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelMethodBuilder >> thrownTypeReferences:  aCollection [ 

	^ thrownTypeReferences := aCollection
]
