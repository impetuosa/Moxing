"
I build declartion units (such as source file, program etc. i have imports and i could have exports )
"
Class {
	#name : #MOModelDeclarationUnitBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'imports',
		'types',
		'package',
		'decorator',
		'decorators'
	],
	#category : #'Moxing-MicroBuilders'
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
MOModelDeclarationUnitBuilder >> addImport: aMOImport [

	self imports add: aMOImport
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> addType: aMOPrimitiveType [

	self assert:
		(self types noneSatisfy: [ :t | t name = aMOPrimitiveType name ]).
	self types add: aMOPrimitiveType
]

{ #category : #'as yet unclassified' }
MOModelDeclarationUnitBuilder >> bindingConfiguration [

	"On the left the attribute names for MODeclarationUnit. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #imports. #imports }.
		  { #types. #types } }
]

{ #category : #'as yet unclassified' }
MOModelDeclarationUnitBuilder >> buildsType [
<generated>
	^MODeclarationUnit
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
	self imports: anEntity imports. 
 self types: anEntity types. 
 
	
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
		            types: self types;
		            parent: self package;
		            yourself.
	self package ifNotNil: [ self package declarationUnits add: instance ].
	^ instance
]

{ #category : #adding }
MOModelDeclarationUnitBuilder >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
MOModelDeclarationUnitBuilder >> types: anObject [

	types := anObject
]
