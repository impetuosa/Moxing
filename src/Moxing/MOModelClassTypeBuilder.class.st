"
I build class types (also called interfaces )
"
Class {
	#name : #MOModelClassTypeBuilder,
	#superclass : #MOModelTypeParameterBuilder,
	#instVars : [
		'modifiers',
		'attributes',
		'methods',
		'typeParameters',
		'decorators'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelClassTypeBuilder >> addAttribute: anAttribute [

	self attributes add: anAttribute
]

{ #category : #adding }
MOModelClassTypeBuilder >> addDecorator: aMODecorator [

	self decorators add: aMODecorator
]

{ #category : #adding }
MOModelClassTypeBuilder >> addMethod: aMOProcedure [

	self methods add: aMOProcedure
]

{ #category : #adding }
MOModelClassTypeBuilder >> addModifier: aString [ 
	self modifiers add: aString 
]

{ #category : #accessing }
MOModelClassTypeBuilder >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
]

{ #category : #accessing }
MOModelClassTypeBuilder >> attributes [

	^ attributes ifNil: [ attributes := OrderedCollection new ]
]

{ #category : #accessing }
MOModelClassTypeBuilder >> attributes: anObject [

	attributes := anObject
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> bindingConfiguration [

	"On the left the attribute names for MOClassType. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #name. #name }.
		  { #modifiers. #modifiers }.
		  { #parent. #parent }.
		  { #typeParameters. #typeParameters }.
		  { #packageReference. #packageReference }.
		  { #attributes. #attributes }.
		  { #methods. #methods }.
		  { #superTypeReferences. #superTypeReferences } }
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> buildsType [
<generated>
	^MOClassType
]

{ #category : #generated }
MOModelClassTypeBuilder >> decorators [
	^ decorators ifNil: [ decorators := OrderedCollection new  ]
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self modifiers: anEntity modifiers.
	self parent: anEntity parent.
	self typeParameters: anEntity typeParameters.
	self packageReference: anEntity packageReference.
	self attributes: anEntity attributes.
	self methods: anEntity methods.
	self superTypeReferences: anEntity superTypeReferences.
	self decorators: anEntity decorators
]

{ #category : #accessing }
MOModelClassTypeBuilder >> methods [
	
	^ methods ifNil: [ methods := OrderedCollection new ]
]

{ #category : #accessing }
MOModelClassTypeBuilder >> methods: anObject [

	methods := anObject
]

{ #category : #accessing }
MOModelClassTypeBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
]

{ #category : #accessing }
MOModelClassTypeBuilder >> modifiers: anObject [

	modifiers := anObject
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> privateBuild [

	^ (self instantiate: MOClassType)
		  name: self name;
		  modifiers: self modifiers;
		  parent: self parent;
		  visibility: self visibility;
		  decorators: self decorators;
		  typeParameters: self typeParameters;
		  packageReference: self packageReference;
		  attributes: self attributes;
		  methods: self methods;
		  superTypeReferences: self superTypeReferences;
		  yourself
]

{ #category : #adding }
MOModelClassTypeBuilder >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ] 
]

{ #category : #accessing }
MOModelClassTypeBuilder >> typeParameters: anObject [

	typeParameters := anObject
]
