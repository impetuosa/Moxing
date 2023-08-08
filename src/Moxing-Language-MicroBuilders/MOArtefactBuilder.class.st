Class {
	#name : #MOArtefactBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'types',
		'packages',
		'declarationUnits',
		'name'
	],
	#category : #'Moxing-Language-MicroBuilders-project'
}

{ #category : #adding }
MOArtefactBuilder >> addAliasType: aMOAlias [

	self addType: aMOAlias
]

{ #category : #accessing }
MOArtefactBuilder >> addDeclarationUnit: aMODeclarationUnit [

	self declarationUnits add: aMODeclarationUnit
]

{ #category : #adding }
MOArtefactBuilder >> addEnum: aMOEnum [

	self addType: aMOEnum
]

{ #category : #accessing }
MOArtefactBuilder >> addPackage: aPack [

	self packages add: aPack
]

{ #category : #adding }
MOArtefactBuilder >> addPrimitiveType: aMOPrimitiveType [

	self addType: aMOPrimitiveType
]

{ #category : #adding }
MOArtefactBuilder >> addStructureType: aMOStructure [

	self addType: aMOStructure
]

{ #category : #accessing }
MOArtefactBuilder >> addType: aPack [

	self types add: aPack
]

{ #category : #accessing }
MOArtefactBuilder >> declarationUnits [

	^ declarationUnits ifNil: [ 
		  declarationUnits := OrderedCollection new ]
]

{ #category : #accessing }
MOArtefactBuilder >> declarationUnits: anObject [

	declarationUnits := anObject
]

{ #category : #adding }
MOArtefactBuilder >> name [

	^ name
]

{ #category : #adding }
MOArtefactBuilder >> name: aName [

	aName ifNil: [ self halt ].
	name := aName
]

{ #category : #accessing }
MOArtefactBuilder >> packages [

	^  packages ifNil: [ packages := OrderedCollection new ]
]

{ #category : #accessing }
MOArtefactBuilder >> packages: anObject [

	packages := anObject
]

{ #category : #accessing }
MOArtefactBuilder >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
MOArtefactBuilder >> types: anObject [

	types := anObject
]
