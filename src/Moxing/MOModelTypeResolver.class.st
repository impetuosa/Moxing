"
I am in charge of binding the type reference with a type declaration

"
Class {
	#name : #MOModelTypeResolver,
	#superclass : #MOModelDeclarationResolver,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Linking'
}

{ #category : #'as yet unclassified' }
MOModelTypeResolver >> lookIntoPackage: aPackage [

	self registerPossibles:
		(aPackage allTypes select: [ :t | t name = resolving name ])
]

{ #category : #accessing }
MOModelTypeResolver >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelTypeResolver >> processTypeReference: aMOTypeReference [

	aMOTypeReference isSolvable ifFalse: [ ^ self ].
	resolving := aMOTypeReference.

	aMOTypeReference acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOModelTypeResolver >> registerPossibles: aCollection [

	(aCollection anySatisfy: [ :a | a isKindOf: MODeclarationUnit ]) 
		ifTrue: [ self halt ].
	aCollection ifNotEmpty: [ 
		self assert: aCollection isNotNil.
		resolving referee: aCollection first ]
]

{ #category : #'as yet unclassified' }
MOModelTypeResolver >> typeHasBeenResolved [
	^ resolving referee isNotNil 
]

{ #category : #'as yet unclassified' }
MOModelTypeResolver >> unknownType [
	^ model unknownType 
]

{ #category : #visiting }
MOModelTypeResolver >> visitAnnotation: aMOAnnotationInstance [

	aMOAnnotationInstance parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitArrayTypeReference: aMOArrayTypeReference [

	aMOArrayTypeReference argumentTypeReferences do: [ :r | 
		r acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeResolver >> visitAssignment: aMOAssignment [ 
	aMOAssignment parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitAttribute: aMOAttribute [

	^ aMOAttribute parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitBlock: aMOBlock [

	^ aMOBlock parent ifNotNil:[ : f|f acceptVisitor: self]
]

{ #category : #visiting }
MOModelTypeResolver >> visitBlockClosure: aMOStBlockClosure [ 
	aMOStBlockClosure parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitCatch: aMOCatch [

	^ aMOCatch parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitClass: aMOClass [
	
	aMOClass packageReference acceptVisitor: self.
	aMOClass parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitClassType: aMOClassType [

	aMOClassType packageReference acceptVisitor: self.
	aMOClassType parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitConstructor: aMOConstructor [

	^ aMOConstructor parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitDeclarationUnit: aMODeclarationUnit [

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
MOModelTypeResolver >> visitGlobalVariable: aMOSharedVariable [ 
	aMOSharedVariable  parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitImport: aMOImport [

	aMOImport packageReference acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitJavaClass: aMOJavaClass [

	^ self visitClass: aMOJavaClass
]

{ #category : #visiting }
MOModelTypeResolver >> visitLocalVariable: aMOLocalVariable [ 
	self visitVariable: aMOLocalVariable 
]

{ #category : #visiting }
MOModelTypeResolver >> visitMetaClass: aMOMetaClass [ 
 aMOMetaClass 	 parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitMethod: aMOMethod [

	aMOMethod parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitMethodInvocation: aMOMethodInvocation [ 
	aMOMethodInvocation parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitNewExpression: aMONewExpression [

	^ aMONewExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitPackage: aMOPackage [

	resolving packageReference ifNil: [ ^ self ].
	resolving packageReference referee = aMOPackage ifTrue: [ 
		self registerPossibles:
			(aMOPackage allTypes select: [ :i | i name = resolving name ]) ]
]

{ #category : #visiting }
MOModelTypeResolver >> visitPackageReference: aMOPackageReference [

	self assert: aMOPackageReference referee isNotNil.
	self lookIntoPackage: aMOPackageReference referee.
	self typeHasBeenResolved ifTrue: [ ^ self ].

	aMOPackageReference parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeResolver >> visitParameter: aMOParameter [

	self assert: aMOParameter typeReference referee isNil.
	aMOParameter parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitParametrizableClass: aMOParametrizableClass [

	self registerPossibles:
		(aMOParametrizableClass typeParameters select: [ :t | 
			 t name = resolving name ]).
	self typeHasBeenResolved ifFalse: [ 
		aMOParametrizableClass packageReference acceptVisitor: self.
		aMOParametrizableClass parent ifNotNil: [ :a | 
			a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOModelTypeResolver >> visitParametrizableClassType: aMOParametrizableClassType [

	self registerPossibles:
		(aMOParametrizableClassType typeParameters select: [ :t | 
			 t name = resolving name ]).
	self typeHasBeenResolved ifFalse: [ 
		aMOParametrizableClassType packageReference acceptVisitor: self.
		aMOParametrizableClassType parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeResolver >> visitParametrizableMethod: aMOParametrizableMethod [

	^ self visitMethod: aMOParametrizableMethod
]

{ #category : #visiting }
MOModelTypeResolver >> visitParametrizedTypeReference: aMOParametrizedTypeReference [

	self visitTypeReference: aMOParametrizedTypeReference
]

{ #category : #visiting }
MOModelTypeResolver >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	self assert: aMOPrimitiveTypeReference referee isNotNil
]

{ #category : #visiting }
MOModelTypeResolver >> visitReturn: aMOReturn [ 
	aMOReturn parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitSharedVariable: aMOSharedVariable [ 
	 ^ aMOSharedVariable parent acceptVisitor: self 
]

{ #category : #visiting }
MOModelTypeResolver >> visitStArrayExpression: aMOStArrayExpression [ 

]

{ #category : #visiting }
MOModelTypeResolver >> visitStCascade: aMOStCascade [ 
	aMOStCascade  parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitStClass: aMOStClass [ 
	self visitClass: aMOStClass 
]

{ #category : #visiting }
MOModelTypeResolver >> visitStExensionMethodDeclarationUnit: aMOStExensionMethodDeclarationUnit [
  ^aMOStExensionMethodDeclarationUnit parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitStMethod: aMOStMethod [ 
self visitMethod: aMOStMethod 
]

{ #category : #visiting }
MOModelTypeResolver >> visitStatementExpression: aMOStatementExpression [ 
	aMOStatementExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitTryCatch: aMOTryCatch [

	aMOTryCatch parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitTypeParameter: aMOTypeParameter [ 
	aMOTypeParameter parent acceptVisitor: self 
]

{ #category : #visiting }
MOModelTypeResolver >> visitTypeReference: aMOTypeReference [

	aMOTypeReference referee ifNotNil: [ ^ self ].
	aMOTypeReference parent ifNil: [ ^ self ].
	aMOTypeReference parent isTypeReference ifFalse: [ 
		""
		aMOTypeReference parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeResolver >> visitVarArgParameter: aMOVariableArgumentsParameter [

	self assert:
		aMOVariableArgumentsParameter typeReference referee isNil.
	aMOVariableArgumentsParameter parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeResolver >> visitVariable: aMOVariable [
	
	^ aMOVariable parent ifNotNil: [: d| d acceptVisitor: self]
]

{ #category : #visiting }
MOModelTypeResolver >> visitVisualWorksPackage: aMOVisualWorksPackage [
  resolving packageReference ifNil: [ ^self ].
  resolving packageReference referee = aMOVisualWorksPackage ifTrue: [ self registerPossibles: (aMOVisualWorksPackage allTypes select: [:i |  i name = resolving name ]) ]
]
