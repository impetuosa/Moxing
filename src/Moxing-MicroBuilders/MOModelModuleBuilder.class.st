"
I build modules 
"
Class {
	#name : #MOModelModuleBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'invocables',
		'attributes',
		'types'
	],
	#category : #'Moxing-MicroBuilders-types'
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
MOModelModuleBuilder >> buildsType [
<generated>
	^MOModule
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
	self invocables: anEntity invocables.
	self attributes: anEntity attributes.
	self types: anEntity types.
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> name [
	^ name ifNil: [  self error: 'Module name cannot be nil' ]
]

{ #category : #accessing }
MOModelModuleBuilder >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  name: self name;
		  attributes: self attributes;
		  invocables: self invocables;
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
