"
I am in charge of binding a variable reference with a variable / attribute / parameter declarations
"
Class {
	#name : #MOModelVariableLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Linking'
}

{ #category : #accessing }
MOModelVariableLinker >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelVariableLinker >> processVariableReference: aMOVariableReference [

	resolving := aMOVariableReference.
	aMOVariableReference acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOModelVariableLinker >> variableHasBeenResolved [
	^ resolving candidate isNotNil 
]

{ #category : #visiting }
MOModelVariableLinker >> visitBlock: aMOBlock [

	aMOBlock statements
		detect: [ :v | 
		(v isKindOf: MOLocalVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOBlock parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableLinker >> visitClass: aMOClass [

	aMOClass attributes
		detect: [ :v | 
		(v isKindOf: MOAttribute) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOClass parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableLinker >> visitDeclarationUnit: aMODeclarationUnit [

	^ aMODeclarationUnit parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableLinker >> visitMethod: aMOMethod [

	aMOMethod parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableLinker >> visitMethodInvocation: aMOMethodInvocation [

	^ aMOMethodInvocation parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableLinker >> visitPackage: aMOPackage [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOModelVariableLinker >> visitParametrizableClass: aMOParametrizableClass [

	self visitClass: aMOParametrizableClass
]

{ #category : #visiting }
MOModelVariableLinker >> visitReturn: aMOReturn [

	aMOReturn parent acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOModelVariableLinker >> visitStatementExpression: aMOStatementExpression [

	^ aMOStatementExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableLinker >> visitVariableReference: aMOVariableReference [

	^ aMOVariableReference parent acceptVisitor: self
]
