"
i Build primitive types
"
Class {
	#name : #MOPrimitiveTypeBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'parent'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOPrimitiveTypeBuilder >> bindingConfiguration [

	"On the left the attribute names for MOPrimitiveType. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #name. #name }.
		  { #parent. #parent } }
]

{ #category : #'as yet unclassified' }
MOPrimitiveTypeBuilder >> buildsType [
<generated>
	^MOPrimitiveType
]

{ #category : #'as yet unclassified' }
MOPrimitiveTypeBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self parent: anEntity parent
]

{ #category : #accessing }
MOPrimitiveTypeBuilder >> name [

	^ name ifNil: [ self error: ' Name is Nil! ' ]
]

{ #category : #accessing }
MOPrimitiveTypeBuilder >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
MOPrimitiveTypeBuilder >> parent [

	^ parent ifNil: [ parent := parentBuilder model ]
]

{ #category : #accessing }
MOPrimitiveTypeBuilder >> parent: anObject [

	parent := anObject
]

{ #category : #'as yet unclassified' }
MOPrimitiveTypeBuilder >> privateBuild [

	^ (self instantiate: MOPrimitiveType)
		  name: self name;
		  parent: self parent;
		  yourself
]
