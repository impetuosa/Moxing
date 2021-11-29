Class {
	#name : #MOModelVariableLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Core'
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
		(v isKindOf: MOVariable) and: [ v name = resolving name ] ]
		ifFound: [ :c | resolving candidate: c ]
		ifNone: [ aMOBlock parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelVariableLinker >> visitMethodInvocation: aMOMethodInvocation [

	aMOMethodInvocation parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableLinker >> visitReturn: aMOReturn [

	aMOReturn parent acceptVisitor: self
]

{ #category : #visiting }
MOModelVariableLinker >> visitVariableReference: aMOVariableReference [

	^ aMOVariableReference parent acceptVisitor: self
]
