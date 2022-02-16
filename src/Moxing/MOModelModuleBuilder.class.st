"
I build modules 
"
Class {
	#name : #MOModelModuleBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'packageReference',
		'imports',
		'invocables',
		'attributes',
		'types'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelModuleBuilder >> addAccessor: aMOAccessor [

	self addFunction: aMOAccessor
]

{ #category : #adding }
MOModelModuleBuilder >> addAttribute: aMOAttribute [

	self attributes add: aMOAttribute
]

{ #category : #adding }
MOModelModuleBuilder >> addConstant: aMOConstant [

	self addAttribute: aMOConstant
]

{ #category : #adding }
MOModelModuleBuilder >> addFunction: aMOFunction [

	self addInvocable: aMOFunction
]

{ #category : #adding }
MOModelModuleBuilder >> addInvocable: anObject [

	^ self invocables add: anObject
]

{ #category : #adding }
MOModelModuleBuilder >> addProcedure: aMOProcedure [

	self addInvocable: aMOProcedure
]

{ #category : #adding }
MOModelModuleBuilder >> addStructureType: aMOStructure [

	self addType: aMOStructure
]

{ #category : #adding }
MOModelModuleBuilder >> addType: aMOEnum [

	self types add: aMOEnum
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> attributes [

	^ attributes ifNil: [ attributes := OrderedCollection new ]
]

{ #category : #accessing }
MOModelModuleBuilder >> attributes: aCollection [ 
	attributes := aCollection
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> bindingConfiguration [

	"On the left the attribute names for MOModule. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #name. #name }.
		  { #imports. #imports }.
		  { #invocables. #invocables }.
		  { #parent. #packageReference } }
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> buildsType [
<generated>
	^MOModule
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> imports [
		^ imports ifNil: [ imports := OrderedCollection new ]
]

{ #category : #accessing }
MOModelModuleBuilder >> imports: anObject [

	imports := anObject
]

{ #category : #adding }
MOModelModuleBuilder >> invocables [

	^ invocables ifNil: [ invocables := OrderedCollection new ]
]

{ #category : #accessing }
MOModelModuleBuilder >> invocables: anObject [

	invocables := anObject
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self imports: anEntity imports.
	self invocables: anEntity invocables.
	self attributes: anEntity attributes.
	self types: anEntity types.
	self packageReference: anEntity packageReference
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> name [
	^ name ifNil: [  self error: 'Module name cannot be nil' ]
]

{ #category : #accessing }
MOModelModuleBuilder >> name: aString [

	name := aString
]

{ #category : #accessing }
MOModelModuleBuilder >> package: aMOPackage [

	self packageReference: (self packageReferenceBuilder
			 package: aMOPackage;
			 build)
]

{ #category : #accessing }
MOModelModuleBuilder >> packageReference [

	^ packageReference
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> packageReference: aMOPackageReference [

	packageReference := aMOPackageReference
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> privateBuild [

	^ (self instantiate: MOModule)
		  name: self name;
		  attributes: self attributes;
		  invocables: self invocables;
		  parent: self packageReference;
		  types: self types;
		  yourself
]

{ #category : #accessing }
MOModelModuleBuilder >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
MOModelModuleBuilder >> types: aCol [

	^ types := aCol
]
