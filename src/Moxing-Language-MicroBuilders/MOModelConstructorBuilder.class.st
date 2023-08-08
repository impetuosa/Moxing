"
I build constructors:  
   a behavioral entity that has no selector
"
Class {
	#name : #MOModelConstructorBuilder,
	#superclass : #MOModelInvocableBuilder,
	#instVars : [
		'thrownTypeReferences',
		'annotationInstances',
		'typeParameters'
	],
	#category : #'Moxing-Language-MicroBuilders-invocables'
}

{ #category : #adding }
MOModelConstructorBuilder >> addAnnotationInstance: aMOAnnotationInstance [

	self annotationInstances add: aMOAnnotationInstance
]

{ #category : #adding }
MOModelConstructorBuilder >> addModifier: aString [ 
	self modifiers add: aString 
]

{ #category : #adding }
MOModelConstructorBuilder >> addParameter: aMOParameter [

	self parameters add: aMOParameter
]

{ #category : #adding }
MOModelConstructorBuilder >> addThrownTypeReference: aMOTypeReference [

	self thrownTypeReferences add: aMOTypeReference
]

{ #category : #adding }
MOModelConstructorBuilder >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
]

{ #category : #accessing }
MOModelConstructorBuilder >> annotationInstances [

	^ annotationInstances ifNil: [ 
		  annotationInstances := OrderedCollection new ]
]

{ #category : #accessing }
MOModelConstructorBuilder >> annotationInstances: aCollection [ 
	annotationInstances := aCollection
]

{ #category : #generated }
MOModelConstructorBuilder >> block: aMOBlock [

	self body: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> buildsType [

	<generated>
	^ MOConstructor
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> loadBuilderWithEntity: anEntity [
	super loadBuilderWithEntity: anEntity.
	self annotationInstances: anEntity annotationInstances.
	self typeParameters: anEntity typeParameters.
	self thrownTypeReferences: anEntity thrownTypeReferences.

]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> privateBuild [

	^ super privateBuild
		  thrownTypeReferences: self thrownTypeReferences;
		  typeParameters: self typeParameters;
		  annotationInstances: self annotationInstances;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> thrownTypeReferences [

	^ thrownTypeReferences ifNil: [ 
		  thrownTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelConstructorBuilder >> thrownTypeReferences: aCollection [ 
	thrownTypeReferences := aCollection
]

{ #category : #generated }
MOModelConstructorBuilder >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ] 
]

{ #category : #adding }
MOModelConstructorBuilder >> typeParameters: aCollection [

	typeParameters := aCollection
]
