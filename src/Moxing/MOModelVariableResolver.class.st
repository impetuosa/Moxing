"
I am in charge of binding a variable reference with a variable / attribute / parameter declarations
"
Class {
	#name : #MOModelVariableResolver,
	#superclass : #MOModelDeclarationResolver,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Linking'
}

{ #category : #accessing }
MOModelVariableResolver >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelVariableResolver >> processVariableReference: aMOVariableReference [

	resolving := aMOVariableReference.
	aMOVariableReference acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOModelVariableResolver >> variableHasBeenResolved [
	^ resolving referee isNotNil 
]

{ #category : #visiting }
MOModelVariableResolver >> visitAnnotation: aMOAnnotationInstance [

	^ aMOAnnotationInstance parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitArrayAccess: aMOArrayAccess [

	^ aMOArrayAccess parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitArrayLiteral: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitAssertion: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitAssignment: aMOAssignment [ 
aMOAssignment  parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitAttribute: aMOAttribute [

	^ aMOAttribute parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitAttributeAccess: aMOAttributeAccess [

	^ aMOAttributeAccess parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ aMOBinaryArithmeticOperation parent ifNotNil: [ :p | 
		  p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitBlock: aMOBlock [

	aMOBlock statements
		detect: [ :v | 
			(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving referee: c ]
		ifNone: [ aMOBlock parent ifNotNil: [ :a | a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitBlockClosure: aMOStBlockClosure [ 
aMOStBlockClosure  parameters
		detect: [ :v | 
	v name = resolving name ] 
		ifFound: [ :c | resolving referee: c ]
		ifNone: [ aMOStBlockClosure  parent acceptVisitor: self ].

]

{ #category : #visiting }
MOModelVariableResolver >> visitCastExpression: aMOCastExpression [

	^ aMOCastExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitCatch: aMOCatch [

	aMOCatch parameters
		detect: [ :v | v name = resolving name ]
		ifFound: [ :c | resolving referee: c ]
		ifNone: [ aMOCatch parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitClass: aMOClass [

	aMOClass attributes
		detect: [ :v | 
		(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving referee: c ]
		ifNone: [ aMOClass parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitConditionalExpression: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitConstructor: aMOConstructor [

	^ aMOConstructor parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitConstructorInvocation:  aMOConstructorInvocation [

	^ aMOConstructorInvocation parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitDeclarationUnit: aMODeclarationUnit [

	^ aMODeclarationUnit parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitDoWhileTrue: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitEnumEntry: aMOEnumEntry [

	^ aMOEnumEntry parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitFor: aMOFor [

	^ aMOFor initializeOperation
		  detect: [ :a | a isVariable and: [ a name = resolving name ] ]
		  ifFound: [ :a | resolving referee: a ]
		  ifNone: [ aMOFor parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitForEach: aMOForEach [

	^ aMOForEach each name = resolving name
		  ifTrue: [ resolving referee: aMOForEach each ]
		  ifFalse: [ aMOForEach parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitIfElse: aMOIfElse [

	^ aMOIfElse parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitInvocation: aMOConstructorInvocation [

	^ aMOConstructorInvocation parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitJavaClass: aMOJavaClass [

	^ self visitClass: aMOJavaClass
]

{ #category : #visiting }
MOModelVariableResolver >> visitJavaClassType: aMOJavaClassType [

	^ self visitClass: aMOJavaClassType
]

{ #category : #visiting }
MOModelVariableResolver >> visitLabelWithStatement: aMOLabelWithStatement [

	^ aMOLabelWithStatement parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitLocalVariable: aMOLocalVariable [

	^ aMOLocalVariable parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitMetaClass: aMOMetaClass [ 
aMOMetaClass attributes
		detect: [ :v | 
		(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving referee: c ]
		ifNone: [ aMOMetaClass parent parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitMethod: aMOMethod [

	aMOMethod parameters
		detect: [ :v | v name = resolving name ]
		ifFound: [ :c | resolving referee: c ]
		ifNone: [ aMOMethod parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitMethodInvocation: aMOMethodInvocation [

	^ aMOMethodInvocation parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitNamedSingleArgument: aMONamedSingleArgument [

	aMONamedSingleArgument parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitNewExpression: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitPackage: aMOPackage [ 
	" Nothing to do here "
]

{ #category : #visiting }
MOModelVariableResolver >> visitParametrizableClass: aMOParametrizableClass [

	self visitClass: aMOParametrizableClass
]

{ #category : #visiting }
MOModelVariableResolver >> visitParametrizableClassType: aMOParametrizableClassType [

	^ self visitClass: aMOParametrizableClassType
]

{ #category : #visiting }
MOModelVariableResolver >> visitParametrizableMethod: aMOParametrizableMethod [

	^ aMOParametrizableMethod parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitReturn: aMOReturn [

	aMOReturn parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitStArrayExpression: aMOStArrayExpression [ 
	aMOStArrayExpression parent acceptVisitor: self 
]

{ #category : #visiting }
MOModelVariableResolver >> visitStCascade: aMOStCascade [ 
	aMOStCascade parent acceptVisitor: self 
]

{ #category : #visiting }
MOModelVariableResolver >> visitStClass: aMOStClass [ 
	self visitClass: aMOStClass 
]

{ #category : #visiting }
MOModelVariableResolver >> visitStExensionMethodDeclarationUnit: aMOStExensionMethodDeclarationUnit [
  ^aMOStExensionMethodDeclarationUnit parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitStMethod: aMOStMethod [ 
	self visitMethod: aMOStMethod 
]

{ #category : #'as yet unclassified' }
MOModelVariableResolver >> visitStatementExpression: aMOStatementExpression [

	^ aMOStatementExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitStaticInitializer: aMOStaticInitializer [

	^ aMOStaticInitializer parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitSwitch: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitSynchronizedBlock: aMOSynchronizedBlock [

	^ aMOSynchronizedBlock parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitThrow: aMOObject [

	^ aMOObject parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitTryCatch: aMOTryCatch [

	^ aMOTryCatch parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	^ aMOUnaryArithmeticOperation parent ifNotNil: [ :p | 
		  p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitVariableReference: aMOVariableReference [

	^ aMOVariableReference parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitVisualWorksPackage: aMOVisualWorksPackage [ 

		^ aMOVisualWorksPackage sharedVariables 
			detect: [ :v | 
				(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
			ifFound: [ :c | resolving referee: c ]
	


]

{ #category : #visiting }
MOModelVariableResolver >> visitWhile: aMOWhile [

	^ aMOWhile parent acceptVisitor: self
]
