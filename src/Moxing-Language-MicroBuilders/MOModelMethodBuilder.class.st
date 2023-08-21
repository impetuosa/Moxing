"
I build methods
"
Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#instVars : [
		'thrownTypeReferences',
		'annotationInstances'
	],
	#category : #'Moxing-Language-MicroBuilders-Invocables'
}

{ #category : #adding }
MOModelMethodBuilder >> addAnnotationInstance: aMOAnnotationInstance [

	self annotationInstances add: aMOAnnotationInstance
]

{ #category : #accessing }
MOModelMethodBuilder >> annotationInstances [
 
	^ annotationInstances ifNil: [ 
		  annotationInstances := OrderedCollection new ]
]

{ #category : #accessing }
MOModelMethodBuilder >> annotationInstances: aCollection [ 
	annotationInstances := aCollection
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> buildsType [

	<generated>
	^ MOMethod
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self thrownTypeReferences: anEntity thrownTypeReferences.
	self annotationInstances: anEntity annotationInstances
]

{ #category : #accessing }
MOModelMethodBuilder >> privateBuild [

	"self assert: self returnTypeReference isNotNil."

	^ super privateBuild
		  thrownTypeReferences: self thrownTypeReferences;
		  annotationInstances: self annotationInstances;
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

{ #category : #generated }
MOModelMethodBuilder >> typeParameters [
	self shouldBeImplemented.
]
