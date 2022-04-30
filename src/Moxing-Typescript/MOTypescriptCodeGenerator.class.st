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
MOTypescriptCodeGenerator >> visitAngularClass: aMOAngularClass [ 
	aMOAngularClass classRepresentation acceptVisitor: self 
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitAngularComponent: aMOAngularComponent [

	^ aMOAngularComponent behavior acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitAngularCssDocument: aMOAngularCssDocument [ 
	stream nextPutAll: aMOAngularCssDocument document 
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitAngularTemplateDocument: aMOAngularTemplateDocument [ 
	stream nextPutAll: aMOAngularTemplateDocument document printString .
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitAttribute: aMOTypescriptVariable [

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.

	aMOTypescriptVariable typeReference ifNotNil: [ 
		stream nextPutAll: ':'.
		aMOTypescriptVariable typeReference acceptVisitor: self ].
	aMOTypescriptVariable initializer  ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitAttributeAccess: aMOAttributeAccess [

	aMOAttributeAccess receiverReference acceptVisitor: self.
	stream
		nextPutAll: '.';
		nextPutAll: aMOAttributeAccess name
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
MOTypescriptCodeGenerator >> visitCatch: aMOCatch [ 
	self printIndentation.
	stream nextPutAll: 'catch ('.
	self streamArguments: aMOCatch parameters. 
	stream nextPutAll: ')'.
	aMOCatch block acceptVisitor: self.
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitClass: aMOClass [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitClassFunction: aMOClassFunction [

	^ self visitMethod: aMOClassFunction
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitConstantReference: aMOConstantReference [

	^ self visitVariableReference: aMOConstantReference
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
					 (aJinTypescriptDecorator arguments collect: #literal) asArray);
		nextPutAll: ')';
		cr
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [ 
	
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitFileImport: aMOFileImport [

	stream
		nextPutAll: aMOFileImport printString;
		newLine
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
MOTypescriptCodeGenerator >> visitLabelReference: aMOAlceLabelReference [

	^ self comment: [ 
		  stream
			  nextPutAll: ' Label Usage:   ';
			  nextPutAll: aMOAlceLabelReference name ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitLocalVariable: aMOLocalVariable [

	stream nextPutAll: aMOLocalVariable name.

	aMOLocalVariable typeReference ifNotNil: [ 
		stream nextPutAll: ' : '.
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
		stream nextPutAll: ':'.
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
		stream
			nextPutAll: ' : '. aMOParameter typeReference
			acceptVisitor: self ]
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
MOTypescriptCodeGenerator >> visitResumeLabel: aMOAlceResumeLabel [

	self comment: [ 
		stream nextPutAll: ' Resume '.
		aMOAlceResumeLabel destinations do: [ :a | 
			stream
				nextPutAll: ' Label ';
				nextPutAll: a name ] ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitSelfReference: aMOSelf [

	stream nextPutAll: 'this'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitSetToReturn: aMOSetToReturn [

	stream
		nextPutAll: aMOSetToReturn invocableSelector;
		nextPutAll: ' = '.
	aMOSetToReturn expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitStatementExpression: aMOStatementExpression [

	^ aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTryCatch: aMOTryCatch [

	stream nextPutAll: 'try'.
	aMOTryCatch try acceptVisitor: self.
	
	self visitCollection: aMOTryCatch catches 
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	stream nextPutAll: aFylgjaMissingType name
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

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitVarArgParameter: aMOVariableArgumentsParameter [

	stream nextPutAll: '...'.
	self visitParameter: aMOVariableArgumentsParameter
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitVariable: aMOTypescriptVariable [

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.

	aMOTypescriptVariable typeReference ifNotNil: [ 
		stream nextPutAll: ':'.
		aMOTypescriptVariable typeReference acceptVisitor: self ].
	aMOTypescriptVariable initializer ifNotNil: [ 
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
