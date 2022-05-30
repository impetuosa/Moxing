"
I build class types (also called interfaces )
"
Class {
	#name : #MOModelClassTypeBuilder,
	#superclass : #MOModelOOTypeBuilder,
	#instVars : [
		'modifiers',
		'attributes',
		'methods',
		'decorators',
		'annotationInstances'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelClassTypeBuilder >> addAnnotationInstance: aMOAnnotationInstance [

	self annotationInstances add: aMOAnnotationInstance
]

{ #category : #adding }
MOModelClassTypeBuilder >> addAttribute: anAttribute [

	self attributes add: anAttribute
]

{ #category : #adding }
MOModelClassTypeBuilder >> addMethod: aMOProcedure [

	self methods add: aMOProcedure
]

{ #category : #adding }
MOModelClassTypeBuilder >> addModifier: aString [ 
	self modifiers add: aString 
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> annotationInstances [

	^ annotationInstances ifNil: [ 
		  annotationInstances := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> annotationInstances: aCollection [

	annotationInstances := aCollection
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
MOModelClassTypeBuilder >> buildsType [

	<generated>
	^ MOClassType
]

{ #category : #'as yet unclassified' }
MOModelClassTypeBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self attributes: anEntity attributes.
	self methods: anEntity methods.
	self superTypeReferences: anEntity superTypeReferences.
	self annotationInstances: anEntity annotationInstances
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

	^ super privateBuild
		  modifiers: self modifiers;
		  attributes: self attributes;
		  methods: self methods;
		  annotationInstances: self annotationInstances;
		  yourself
]
