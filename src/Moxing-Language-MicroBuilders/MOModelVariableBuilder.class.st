"
I build variables (local by default )
"
Class {
	#name : #MOModelVariableBuilder,
	#superclass : #MOModelBuilderDelegate,
	#traits : 'MOManageBindingPolicy',
	#classTraits : 'MOManageBindingPolicy classTrait',
	#instVars : [
		'name',
		'typeReference',
		'modifiers',
		'initializer',
		'annotationInstances'
	],
	#category : #'Moxing-Language-MicroBuilders-Variables'
}

{ #category : #adding }
MOModelVariableBuilder >> addAnnotationInstance: aMOAnnotationInstance [

	self annotationInstances add: aMOAnnotationInstance
]

{ #category : #adding }
MOModelVariableBuilder >> addModifier: aString [

	self modifiers add: aString
]

{ #category : #accessing }
MOModelVariableBuilder >> annotationInstances [

	^ annotationInstances ifNil: [ 
		  annotationInstances := OrderedCollection new ]
]

{ #category : #accessing }
MOModelVariableBuilder >> annotationInstances: aCol [

	annotationInstances := aCol
]

{ #category : #'as yet unclassified' }
MOModelVariableBuilder >> buildsType [
<generated>
	^MOLocalVariable
]

{ #category : #accessing }
MOModelVariableBuilder >> initializer [
	^ initializer
]

{ #category : #accessing }
MOModelVariableBuilder >> initializer: aMONewExpression [ 
	initializer := aMONewExpression
]

{ #category : #'as yet unclassified' }
MOModelVariableBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self initializer: anEntity initializer.
	self modifiers: anEntity modifiers.
	self typeReference: anEntity typeReference.
	self bindingKind: anEntity bindingKind.
	self annotationInstances: anEntity annotationInstances
]

{ #category : #accessing }
MOModelVariableBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
]

{ #category : #accessing }
MOModelVariableBuilder >> modifiers: aCollection [ 
	modifiers := aCollection
]

{ #category : #accessing }
MOModelVariableBuilder >> name [
	^ name ifNil: [ self error: ' Name is Nil ' ]
]

{ #category : #accessing }
MOModelVariableBuilder >> name: aString [ 
	name := aString 
]

{ #category : #'as yet unclassified' }
MOModelVariableBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  name: self name;
		  bindingKind: self bindingKind;
		  initializer: self initializer;
		  modifiers: self modifiers;
		  typeReference: self typeReference;
		  annotationInstances: self annotationInstances;
		  yourself
]

{ #category : #accessing }
MOModelVariableBuilder >> setDefaultBinding [
	self setStaticBinding.
]

{ #category : #accessing }
MOModelVariableBuilder >> type: aMOClass [

	self typeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelVariableBuilder >> typeReference [

	^ typeReference ifNil: [ 
		  typeReference := self typeReferenceBuilder
			                   unknownType;
			                   build ]
]

{ #category : #accessing }
MOModelVariableBuilder >> typeReference: aMOTypeReference [

	typeReference := aMOTypeReference
]
