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
	^ resolving candidate isNotNil 
]

{ #category : #visiting }
MOModelVariableResolver >> visitAssignment: aMOAssignment [ 
aMOAssignment  parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitBlock: aMOBlock [
  aMOBlock statements detect: [:v |  (v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ] ifFound: [:c |  resolving candidate: c ] ifNone: [ aMOBlock parent ifNotNil: [:a |  a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitBlockClosure: aMOStBlockClosure [ 
aMOStBlockClosure  parameters
		detect: [ :v | 
	v name = resolving name ] 
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOStBlockClosure  parent acceptVisitor: self ].

]

{ #category : #visiting }
MOModelVariableResolver >> visitClass: aMOClass [

	aMOClass attributes
		detect: [ :v | 
		(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOClass parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitDeclarationUnit: aMODeclarationUnit [

	^ aMODeclarationUnit parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitMetaClass: aMOMetaClass [ 
aMOMetaClass attributes
		detect: [ :v | 
		(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOMetaClass parent parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableResolver >> visitMethod: aMOMethod [
aMOMethod  parameters
		detect: [ :v | 
v name = resolving name ] 
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOMethod  parent acceptVisitor: self ].

]

{ #category : #visiting }
MOModelVariableResolver >> visitMethodInvocation: aMOMethodInvocation [

	^ aMOMethodInvocation parent acceptVisitor: self
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
MOModelVariableResolver >> visitStMethod: aMOStMethod [ 
	self visitMethod: aMOStMethod 
]

{ #category : #'as yet unclassified' }
MOModelVariableResolver >> visitStatementExpression: aMOStatementExpression [

	^ aMOStatementExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitVariableReference: aMOVariableReference [

	^ aMOVariableReference parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableResolver >> visitVisualWorksPackage: aMOVisualWorksPackage [ 

		^ aMOVisualWorksPackage sharedVariables 
			detect: [ :v | 
				(v isKindOf: MOAbstractVariable) and: [ v name = resolving name ] ]
			ifFound: [ :c | resolving candidate: c ]
	


]
