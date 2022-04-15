"
I build modules 
"
Class {
	#name : #MOModelModuleBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'invocables',
		'types',
		'variables',
		'constants'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelModuleBuilder >> addAttributeAccessor: aMOAccessor [

	self addFunction: aMOAccessor
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
MOModelModuleBuilder >> addGlobalConstant: aMOGlobalConstant [ 
	self constants add: aMOGlobalConstant
]

{ #category : #adding }
MOModelModuleBuilder >> addGlobalVariable: aMOAttribute [

	self variables add: aMOAttribute
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
MOModelModuleBuilder >> buildsType [
<generated>
	^MOModule
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> constants [

	^ constants ifNil: [ constants := OrderedCollection new ]
]

{ #category : #accessing }
MOModelModuleBuilder >> constants: aCollection [ 
	constants := aCollection
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
	self variables: anEntity variables.
	self constants: anEntity constants.
	self types: anEntity types
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
		  variables: self variables;
		  constants: self constants;
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

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> variables [

	^ variables ifNil: [ variables := OrderedCollection new ]
]

{ #category : #accessing }
MOModelModuleBuilder >> variables: aCollection [ 
	variables := aCollection
]
