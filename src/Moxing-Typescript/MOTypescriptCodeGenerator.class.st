Class {
	#name : #MOTypescriptCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Typescript-Writting'
}

{ #category : #visiting }
MOTypescriptCodeGenerator >> closeComment [
  stream nextPutAll: '*/'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> openComment [
  stream nextPutAll: '/*'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> printSelf [

	stream nextPutAll: 'this'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitAngularComponent: aMOAngularComponent [

	^ aMOAngularComponent behavior acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitAttribute: aMOTypescriptVariable [

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.

	aMOTypescriptVariable typeReference ifNotNil: [ 
		aMOTypescriptVariable typeReference acceptVisitor: self ].
	aMOTypescriptVariable initializer  ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitBlockClosure: aMOStBlockClosure [ 
	stream nextPutAll: '('.
	self streamArguments: aMOStBlockClosure parameters .
	stream nextPutAll: ') ' .
	" Should know type maybe here ."
	stream nextPutAll: ' => '.
	aMOStBlockClosure block acceptVisitor: self .
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitConstructor: aMOConstructor [

	self printIndentation.
	stream
		newLine;
		nextPutAll: '';
		nextPutAll: aMOConstructor visibility;
		nextPutAll: ' ';
		nextPutAll: #constructor;
		nextPutAll: '('.
	self streamArguments: aMOConstructor parameters.


	stream nextPutAll: ') '.

	aMOConstructor block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitDeclarationUnit: aMODeclarationUnit [

	self visitCollection: aMODeclarationUnit imports.
	self visitCollection: aMODeclarationUnit types
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitDecorator: aJinTypescriptDecorator [

	self assert: aJinTypescriptDecorator arguments size = 1.
	stream
		cr;
		nextPutAll: '    ';
		nextPutAll: '@';
		nextPutAll: aJinTypescriptDecorator typeReference name;
		nextPutAll: '(';
		nextPutAll: (STONJSON toString:
					 (aJinTypescriptDecorator arguments collect: #literal));
		nextPutAll: ')';
		cr
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [ 
	
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitImport: aMOTypescriptImport [

	aMOTypescriptImport packageReference name = #typescript ifTrue: [ 
		^ self ].
	stream
		nextPutAll: 'import {';
		nextPutAll: aMOTypescriptImport typeReference name;
		nextPutAll: '} from "';
		nextPutAll: aMOTypescriptImport packageReference name;
		nextPutAll: '";';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitLocalVariable: aMOLocalVariable [

	stream nextPutAll: aMOLocalVariable name.

	aMOLocalVariable typeReference ifNotNil: [ 
		aMOLocalVariable typeReference acceptVisitor: self ].
	aMOLocalVariable initializer ifNotNil: [ 
		stream nextPutAll: '='.
		aMOLocalVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitMethod: aJinTypescriptMethod [

	self printIndentation.
	stream
		newLine;
		nextPutAll: '';
		nextPutAll: aJinTypescriptMethod visibility;
		nextPutAll: ' ';
		nextPutAll: aJinTypescriptMethod selector;
		nextPutAll: '('.
	self streamArguments: aJinTypescriptMethod parameters.


	stream nextPutAll: ') '.
	aJinTypescriptMethod returnTypeReference ifNotNil: [ :rtr | 
		rtr acceptVisitor: self ].
	aJinTypescriptMethod block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [
	aMOMethodInvocation receiverReference acceptVisitor: self.
	stream
		nextPutAll: '.';
		nextPutAll: aMOMethodInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOMethodInvocation arguments.
	stream nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitObjectLiteral: aMOTypescriptObjectLiteral [
	stream nextPutAll: '{'.
	aMOTypescriptObjectLiteral literal
		do: [ :l | 
			l key acceptVisitor: self.
			stream nextPutAll: ':'.
			l value acceptVisitor: self.
			stream newLine  ].
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitParameter: aMOParameter [

	stream nextPutAll: aMOParameter name.

	aMOParameter typeReference ifNotNil: [ 
		aMOParameter typeReference acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitParametrizedTypeReference: aMOParametrizedTypeReference [

	self visitTypeReference: aMOParametrizedTypeReference.
	stream
		nextPutAll: #<;
		nextPutAll: (',' join:
					 (aMOParametrizedTypeReference argumentTypeReferences collect:
							  #name));
		nextPutAll: #>
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	^ self visitTypeReference: aMOPrimitiveTypeReference
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitSelfReference: aMOSelf [

	stream nextPutAll: 'this'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitStatementExpression: aMOStatementExpression [

	^ aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	stream
		nextPutAll: ': ';
		nextPutAll: aFylgjaMissingType name
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypescriptClass: aMoTypescriptClass [

	aMoTypescriptClass decorators do: [ :d | d acceptVisitor: self ].


	aMoTypescriptClass modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].

	self
		printClassHeader: aMoTypescriptClass name
		extends: aMoTypescriptClass superclassReference
		implements: aMoTypescriptClass superTypeReferences.

	stream
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aMoTypescriptClass attributes do: [ :m | 
			m acceptVisitor: self.
			stream
				nextPutAll: ';';
				newLine ].
		aMoTypescriptClass methods do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
		stream nextPutAll: '}' ]
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitVariable: aMOTypescriptVariable [

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.

	aMOTypescriptVariable typeReference ifNotNil: [ 
		aMOTypescriptVariable typeReference acceptVisitor: self ].
	aMOTypescriptVariable initializer  ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitVariableReference: aMOVariableRererence [

	(aMOVariableRererence candidate isKindOf: MOAttribute) ifTrue: [ 
		self printSelf.
		stream nextPutAll: '.' ].
	^ super visitVariableReference: aMOVariableRererence
]
