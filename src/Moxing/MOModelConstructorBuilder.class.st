"
I build constructors:  
   a behavioral entity that has no selector
"
Class {
	#name : #MOModelConstructorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'body',
		'parameters',
		'modifiers',
		'thrownTypeReferences',
		'visibility',
		'annotationInstances',
		'typeParameters'
	],
	#category : #'Moxing-MicroBuilders'
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

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> bindingConfiguration [

	"On the left the attribute names for MOConstructor. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #thrownTypeReferences. #thrownTypeReferences }.
		  { #visibility. #visibility }.
		  { #modifiers. #modifiers }.
		  { #parameters. #parameters }.
		  { #block. #body } }
]

{ #category : #generated }
MOModelConstructorBuilder >> block: aMOBlock [

	self body: aMOBlock
]

{ #category : #accessing }
MOModelConstructorBuilder >> body [

	^ body ifNil: [
		  body := self
			          findInModel: [ :a | a isKindOf: MOEmptyBlock ]
			          ifNone: [ self instantiateSubClass: MOEmptyBlock ] ]
]

{ #category : #generated }
MOModelConstructorBuilder >> body: aMOBlock [  
(	aMOBlock isKindOf: MOMethod ) ifTrue: [ self halt  ].
	body := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> buildsType [
<generated>
	^MOConstructor
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> loadBuilderWithEntity: anEntity [

	self annotationInstances: anEntity annotationInstances.
	self typeParameters: anEntity typeParameters.
	self thrownTypeReferences: anEntity thrownTypeReferences.
	self visibility: anEntity visibility.
	self modifiers: anEntity modifiers.
	self parameters: anEntity parameters.
	self body: anEntity block
]

{ #category : #adding }
MOModelConstructorBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
]

{ #category : #accessing }
MOModelConstructorBuilder >> modifiers: aCollection [ 
	modifiers := aCollection
]

{ #category : #generated }
MOModelConstructorBuilder >> parameters [

	^ parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #accessing }
MOModelConstructorBuilder >> parameters: anObject [

	parameters := anObject
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> privateBuild [

	^ (self instantiate: MOConstructor)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  modifiers: self modifiers;
		  parameters: self parameters;
		  typeParameters: self typeParameters;
		  block: self body;
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

{ #category : #accessing }
MOModelConstructorBuilder >> visibility [
	^ visibility
]

{ #category : #accessing }
MOModelConstructorBuilder >> visibility: aString [

	visibility := aString
]
