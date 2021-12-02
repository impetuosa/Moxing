Class {
	#name : #MOTypescriptMethodLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#instVars : [
		'isConstructor'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #accessing }
MOTypescriptMethodLoader >> isConstructor [
	^ isConstructor
]

{ #category : #testing }
MOTypescriptMethodLoader >> isConstructor: aJSMethodDefinitionNode [

	self assert:
		(aJSMethodDefinitionNode isKindOf: JSMethodDefinitionNode).
	^ isConstructor :=  aJSMethodDefinitionNode name source = #constructor
]

{ #category : #generated }
MOTypescriptMethodLoader >> loadArtefact: anAstNode [

	^ (self isConstructor: anAstNode)
		  ifTrue: [ 
			  writer writeConstructor: [ :method | 
				  self use: method during: [ anAstNode acceptVisitor: self ] ] ]
		  ifFalse: [ 
			  writer writeMethod: [ :method | 
				  self use: method during: [ anAstNode acceptVisitor: self ] ] ]
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitMemberFunctionDeclaration: aMethodDefinition [
	self halt .
	writer writeMethod: [ :method | 
		method selector: aMethodDefinition name name value.
		self acceptNodes: aMethodDefinition signature parameters.
		self halt.
		aMethodDefinition signature type. "should get ref "
		method type: aMethodDefinition signature type ].
	self assert: (aMethodDefinition statements noneSatisfy: [ :n | 
			 n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitMethodDefinition: aMethodDefinition [

	self isConstructor ifFalse: [ 
		writer selector: aMethodDefinition name source.
		writer returnTypeReference: (MOTypescriptTypeReferenceLoader
				 loadArtefact: aMethodDefinition type
				 writer: writer) ].

	self acceptNodes: aMethodDefinition parameters

	"should be loading tyype ref statements and params  "
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitVariableDeclaration: aVarDeclaration [

	| param |
	writer writeParameter: [ :parameter | 
		parameter name: aVarDeclaration variable source.
		parameter typeReference: (aVarDeclaration type
				 ifNil: [ self any ]
				 ifNotNil: [ :s | writer typeReferenceNamed: s source ]).
		aVarDeclaration modifier ifNotNil: [ :m | 
			parameter modifier: m source ] ]
]
