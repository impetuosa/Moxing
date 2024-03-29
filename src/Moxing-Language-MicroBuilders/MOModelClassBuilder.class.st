"
I build classes 
"
Class {
	#name : #MOModelClassBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#instVars : [
		'superclassReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Types'
}

{ #category : #adding }
MOModelClassBuilder >> addAttributeAccessor: aMOAccessor [

	self addMethod: aMOAccessor
]

{ #category : #adding }
MOModelClassBuilder >> addConstantAttribute: aMOConstantAttribute [

	self addAttribute: aMOConstantAttribute
]

{ #category : #adding }
MOModelClassBuilder >> addConstructor: aMOConstructor [

	self addMethod: aMOConstructor
]

{ #category : #adding }
MOModelClassBuilder >> addEvent: aMOEvent [ 
		self addMethod: aMOEvent
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> buildsType [
<generated>
	^MOClass
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self superclassReference: anEntity superclassReference
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> privateBuild [

	^ super privateBuild
		  superclassReference: self superclassReference;
		  yourself
]

{ #category : #accessing }
MOModelClassBuilder >> superclass: aMOClass [

	self superclassReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference [
	^ superclassReference
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference: aMOTypeReference [ 
	superclassReference := aMOTypeReference
]
