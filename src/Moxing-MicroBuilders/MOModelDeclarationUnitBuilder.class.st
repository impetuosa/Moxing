"
I build declartion units (such as source file, program etc. i have imports and i could have exports )
"
Class {
	#name : #MOModelDeclarationUnitBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'imports',
		'package',
		'decorator',
		'decorators',
		'declarations'
	],
	#category : #'Moxing-MicroBuilders-project'
}

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addClass: aMOClass [

	decorator ifNotNil: [ 
		aMOClass addDecorator: decorator.
		decorator := nil ].

	self addType: aMOClass
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> addClassType: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addDeclaration: aMOLocalVariable [

	self declarations add: aMOLocalVariable
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addEnum: aMOEnum [

	self addType: aMOEnum
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addImport: aMOImport [

	self imports add: aMOImport
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addJavaEnum: aMOJavaEnum [

	self addEnum: aMOJavaEnum
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addLocalVariable: aMOLocalVariable [

	self addDeclaration: aMOLocalVariable
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addModule: aMOModule [

	self addType: aMOModule
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addStatement: aMOStatementExpression [

	self addDeclaration: aMOStatementExpression
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addStructureType: aMOStructure [

	self addType: aMOStructure
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addType: aMOPrimitiveType [

	self assert: (self declarations noneSatisfy: [ :t | 
			 t isType and: [ t name = aMOPrimitiveType name ] ]).
	self addDeclaration: aMOPrimitiveType
]

{ #category : #'as yet unclassified' }
MOModelDeclarationUnitBuilder >> buildsType [
<generated>
	^MODeclarationUnit
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> declarations [

	^ declarations ifNil: [ declarations := OrderedCollection new ]
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> declarations: anObject [

	declarations := anObject
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> imports [

	^ imports ifNil: [ imports := OrderedCollection new ]
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> imports: anObject [

	imports := anObject
]

{ #category : #'as yet unclassified' }
MOModelDeclarationUnitBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self imports: anEntity imports.
	self declarations: anEntity declarations
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> package [
	^ package
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> package: aMOPackage [

	package := aMOPackage
]

{ #category : #'as yet unclassified' }
MOModelDeclarationUnitBuilder >> privateBuild [

	| instance |
	instance := (self instantiate: MODeclarationUnit)
		            imports: self imports;
		            declarations: self declarations;
		            parent: self package;
		            yourself.
	self package ifNotNil: [ self package declarationUnits add: instance ].
	^ instance
]
