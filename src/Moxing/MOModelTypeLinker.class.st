"
I am in charge of binding the type reference with a type declaration

"
Class {
	#name : #MOModelTypeLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Linking'
}

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> lookIntoPackage: aPackage [

	self registerPossibles:
		(aPackage allTypes select: [ :t | t name = resolving name ])
]

{ #category : #accessing }
MOModelTypeLinker >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> processTypeReference: aMOTypeReference [

	aMOTypeReference isSolvable ifFalse: [ ^ self ].
	resolving := aMOTypeReference.

	aMOTypeReference acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> registerPossibles: aCollection [

	(aCollection anySatisfy: [ :a | a isKindOf: MODeclarationUnit ]) 
		ifTrue: [ self halt ].
	aCollection ifNotEmpty: [ 
		self assert: aCollection isNotNil.
		resolving candidate: aCollection first ]
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> typeHasBeenResolved [
	^ resolving candidate isNotNil 
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> unknownType [
	^ model unknownType 
]

{ #category : #visiting }
MOModelTypeLinker >> visitAnnotation: aMOAnnotationInstance [

	aMOAnnotationInstance parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitArrayTypeReference: aMOArrayTypeReference [

	aMOArrayTypeReference argumentTypeReferences do: [ :r | 
		r acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitAttribute: aMOAttribute [

	^ aMOAttribute parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitBlock: aMOBlock [

	^ aMOBlock parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitClass: aMOClass [
	
	aMOClass packageReference acceptVisitor: self.
	aMOClass parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitClassType: aMOClassType [

	aMOClassType packageReference acceptVisitor: self.
	aMOClassType parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitConstructor: aMOConstructor [

	^ aMOConstructor parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitDeclarationUnit: aMODeclarationUnit [

	| possible |
	possible := aMODeclarationUnit imports select: [ :im | 
		            im resolvesType: resolving ].

	self registerPossibles:
		(possible collect: [ :i | i typeNamed: resolving name ]).

	self typeHasBeenResolved ifFalse: [ 
		aMODeclarationUnit parent ifNil: [ ^ self ].
		aMODeclarationUnit parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitImport: aMOImport [

	aMOImport packageReference acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitMethod: aMOMethod [

	aMOMethod parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitNewExpression: aMONewExpression [

	^ aMONewExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitPackage: aMOPackage [

	resolving packageReference ifNil: [ ^ self ].
	resolving packageReference candidate = aMOPackage ifTrue: [ 
		self registerPossibles:
			(aMOPackage allTypes select: [ :i | i name = resolving name ]) ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitPackageReference: aMOPackageReference [

	self assert: aMOPackageReference candidate isNotNil.
	self lookIntoPackage: aMOPackageReference candidate.
	self typeHasBeenResolved ifTrue: [ ^ self ].

	aMOPackageReference parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitParameter: aMOParameter [

	self assert: aMOParameter typeReference candidate isNil.
	aMOParameter parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitParametrizableClass: aMOParametrizableClass [

	self registerPossibles:
		(aMOParametrizableClass typeParameters select: [ :t | 
			 t name = resolving name ]).
	self typeHasBeenResolved
		ifFalse: [ 
			aMOParametrizableClass packageReference acceptVisitor: self.
			aMOParametrizableClass parent acceptVisitor: self ]
		ifTrue: [ self halt ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitParametrizableClassType: aMOParametrizableClassType [

	self registerPossibles:
		(aMOParametrizableClassType typeParameters select: [ :t | 
			 t name = resolving name ]).
	self typeHasBeenResolved ifFalse: [ 
		aMOParametrizableClassType packageReference acceptVisitor: self.
		aMOParametrizableClassType parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitParametrizedTypeReference: aMOParametrizedTypeReference [

	self visitTypeReference: aMOParametrizedTypeReference
]

{ #category : #visiting }
MOModelTypeLinker >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	self assert: aMOPrimitiveTypeReference candidate isNotNil
]

{ #category : #visiting }
MOModelTypeLinker >> visitTypeParameter: aMOTypeParameter [ 
	aMOTypeParameter parent acceptVisitor: self 
]

{ #category : #visiting }
MOModelTypeLinker >> visitTypeReference: aMOTypeReference [

	aMOTypeReference candidate ifNotNil: [ ^ self ].
	aMOTypeReference parent ifNil: [ ^ self ].
	aMOTypeReference parent isTypeReference ifFalse: [ 
		""
		aMOTypeReference parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitVarArgParameter: aMOVariableArgumentsParameter [

	self assert:
		aMOVariableArgumentsParameter typeReference candidate isNil.
	aMOVariableArgumentsParameter parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitVariable: aMOVariable [

	^ aMOVariable parent acceptVisitor: self
]
