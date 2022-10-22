Class {
	#name : #MOPharoCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-StPharo-writer'
}

{ #category : #visiting }
MOPharoCodeGenerator >> blockDelimiterClose [ 
  ^']'
]

{ #category : #visiting }
MOPharoCodeGenerator >> blockDelimiterOpen [
  ^'['
]

{ #category : #visiting }
MOPharoCodeGenerator >> closeComment [
  ^self openComment
]

{ #category : #visiting }
MOPharoCodeGenerator >> lineDelimiter [
  ^'.'
]

{ #category : #visiting }
MOPharoCodeGenerator >> openComment [
	 self nextPutAll: '"'
]

{ #category : #visiting }
MOPharoCodeGenerator >> printSelf [

	self nextPutAll: 'self'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitAssignment: aMOAssignment [
  aMOAssignment write acceptVisitor: self.
  self
     nextPutAll: ' ';
     nextPutAll: ':=';
     nextPutAll: ' '.
  aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitAttribute: aMOAttribute [
  self nextPutAll: aMOAttribute name
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitBlock: aMOBlock [

	| vars rest |
	vars := aMOBlock statements select: [ :e | e isVariable ].
	rest := aMOBlock statements reject: [ :e | e isVariable ].
	self printIndentation.
	vars ifNotEmpty: [ 
		self nextPutAll: '| '.
		self nextPutAll: (' ' join: (vars collect: #name)).
		self
			nextPutAll: ' |';
			newLine ].
	self increaseDeepDuring: [ 
		rest do: [ :s | 
			self printIndentation.
			s acceptVisitor: self.
			(self requiresTerminator: s) ifTrue: [ 
				self nextPutAll: self lineDelimiter ].
			self newLine ] ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitBlockClosure: aMOStBlockClosure [

	self nextPutAll: self blockDelimiterOpen.
	aMOStBlockClosure parameters do: [ :p | 
		self
			nextPutAll: ' :';
			nextPutAll: p name ].
	aMOStBlockClosure parameters ifNotEmpty: [ self nextPutAll: ' |' ].
	aMOStBlockClosure block acceptVisitor: self.
	self nextPutAll: self blockDelimiterClose
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitCharacterLiteral: aMOCharacterLiteral [

	aMOCharacterLiteral = Character space
		ifTrue: [ self nextPutAll: 'Character space' ]
		ifFalse: [ 
			self 
				nextPut: $$;
				nextPut: aMOCharacterLiteral literal ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitComment: aMOComment [
  ^self comment: [ aMOComment statement acceptVisitor: self ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [

	self nextPutAll: '	self shouldBeImplemented'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitFloatLiteral: aMOFloatLiteral [
  self print: aMOFloatLiteral literal
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitInvocation: aMOInvocation [

	"self assert: (aMOInvocation candidate modifiers includes: #static)."

	self
		nextPutAll:
			' " TODO Function Invocation Is not valid in Java. Must be transformed to Method Invocation ';
		newLine;
		nextPutAll: aMOInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOInvocation arguments.
	self
		nextPutAll: ')';
		newLine;
		nextPutAll: '"'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitMethod: aMOStMethod [

	self
		newLine;
		nextPutAll: '{';
		nextPutAll: '#category:';
		nextPutAll: '''';
		nextPutAll: 'as yet to class';
		nextPutAll: '''';
		nextPutAll: '}';
		newLine.
	self
		newLine;
		nextPutAll: aMOStMethod parent name;
		nextPutAll: '>>'.
	self writeSelectorAndParameters: aMOStMethod.
	self
		nextPutAll: self blockDelimiterOpen;
		newLine.
	aMOStMethod block acceptVisitor: self.
	self printIndentation.
	self
		nextPutAll: self blockDelimiterClose;
		newLine
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [

  aMOMethodInvocation receiverReference acceptVisitor: self.
  self writeSelectorAndArguments: aMOMethodInvocation
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitNewExpression: anExpression [

	stream
		nextPutAll: anExpression typeReference name;
		nextPutAll: ' new '
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitNullLiteral: aMONullLiteral [ 
	self nextPutAll: 'nil'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitParameter: aMOParameter [
  self nextPutAll: aMOParameter name
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitPragma: aMOPhPragma [
  self nextPutAll: '<'.
  self writeSelectorAndParameters: aMOPhPragma.
  self nextPutAll: '>'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitReturn: aMOReturn [

	self nextPutAll: '^ '.
	aMOReturn expression acceptVisitor: self
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitSharedVariable: aMOSharedVariable [ 
  self nextPutAll: aMOSharedVariable name
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStCascade: aMOStCascade [
  | first last rest |
  first := aMOStCascade invocations first.
  rest := aMOStCascade invocations allButFirst.
  last := rest last.
  rest remove: last.
  first acceptVisitor: self.
  self
     nextPutAll: ';';
     newLine.
  self increaseDeepDuring: [ rest do: [:i |  self printIndentation.
              self writeSelectorAndArguments: i.
              self
                 nextPutAll: ';';
                 newLine ].
        self printIndentation.
        self writeSelectorAndArguments: last ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStClass: aMOStClass [

	aMOStClass isPreexisting
		ifTrue: [ 
			self error:
				'preexisting classes cannot be exported. They do not actually exist. Export rather the ExtensionMethodUnit' ]
		ifFalse: [ 
			self
				nextPutAll: 'Class {';
				newLine.
			self increaseDeepDuring: [ 
				self printIndentation.
				self
					nextPutAll: '#name: #''';
					nextPutAll: aMOStClass name;
					nextPutAll: '''';
					nextPutAll: ' ,';
					newLine.
				self printIndentation.
				self
					nextPutAll: '#superclass: #''';
					nextPutAll: aMOStClass superclassReference name;
					nextPutAll: '''';
					nextPutAll: ' ,';
					newLine.
				self printIndentation.
				stream
					nextPutAll: '#category: #''';
					nextPutAll: aMOStClass category;
					nextPutAll: '''';
					nextPutAll: ' ,';
					newLine.
				self printIndentation.

				stream nextPutAll: '#instVars: ['.
				self
					stream: aMOStClass instanceVariables
					splitingWith: [ 
						self
							nextPutAll: ', ';
							nextPutAll: String lf ]
					enclosingWith: [ self nextPutAll: '''' ].
				self printIndentation.
				self
					nextPutAll: '],';
					newLine.
				self printIndentation.

				self nextPutAll: '#sharedVars: ['.
				self
					stream: aMOStClass sharedVariables
					splitingWith: [ 
						self
							nextPutAll: ', ';
							nextPutAll: String lf ]
					enclosingWith: [ self nextPutAll: '''' ].
				self printIndentation.
				self
					nextPutAll: '],';
					newLine.
				self printIndentation.
				self nextPutAll: '#classInstVars: ['.
				self
					stream: aMOStClass metaclass attributes
					splitingWith: [ self nextPutAll: ', ' ]
					enclosingWith: [ self nextPutAll: '''' ].
				self
					nextPutAll: ']';
					newLine ].
			self
				newLine;
				nextPutAll: '}';
				newLine ].
	self visitCollection: aMOStClass metaclass methods.
	self visitCollection: aMOStClass methods
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStExensionMethodDeclarationUnit: aMOStExensionMethodDeclarationUnit [

	self
		nextPutAll: 'Extension {#name : #';
		nextPutAll: aMOStExensionMethodDeclarationUnit classReference name;
		nextPutAll: '}';
		newLine.
	self visitCollection:
		aMOStExensionMethodDeclarationUnit extensionMethods.
	self visitCollection:
		aMOStExensionMethodDeclarationUnit extensionClassMethods
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStMethod: aMOStMethod [

	self
		newLine;
		nextPutAll: '{';
		nextPutAll: '#category:';
		nextPutAll: '''';
		nextPutAll: (aMOStMethod category ifNil: 'as yet to class');
		nextPutAll: '''';
		nextPutAll: '}';
		newLine.
	self
		newLine;
		nextPutAll: aMOStMethod parent name;
		nextPutAll: '>>'.
	self writeSelectorAndParameters: aMOStMethod.
	self
		nextPutAll: self blockDelimiterOpen;
		newLine.
	aMOStMethod block acceptVisitor: self.
	self printIndentation.
	self
		nextPutAll: self blockDelimiterClose;
		newLine
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStatementExpression: aMOStatementExpression [
  aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStringLiteral: aMOStringLiteral [
  | str |
  str := aMOStringLiteral literal.
  
	str := str copyReplaceAll: $' asString with:( $' asString , $'asString ).
	self
     nextPutAll: '''';
     nextPutAll: str;
     nextPutAll: ''''
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitSymbolicArrayLiteral: aMOSymbolicArrayLiteral [ 
	self nextPutAll: '#('.
	self nextPutAll: (	' ' join: 	aMOSymbolicArrayLiteral literal ).
	self nextPutAll: ')'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitTypeReference: aMOTypeReference [

	((aMOTypeReference candidate isNotNil and: [ 
		  aMOTypeReference candidate isStMetaclass ]) ifTrue: [ 
		 self nextPutAll: aMOTypeReference candidate parent name ]) 
		ifFalse: [ self nextPutAll: aMOTypeReference name ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitVariableReference: aMOVariableRererence [

	(aMOVariableRererence candidate isKindOf: MOSelfReference)
		ifTrue: [ aMOVariableRererence candidate acceptVisitor: self ]
		ifFalse: [ 
			(#( Null Nothing ) includes: aMOVariableRererence name)
				ifTrue: [ self nextPutAll: 'nil' ]
				ifFalse: [ self nextPutAll: aMOVariableRererence name ] ]
]

{ #category : #writing }
MOPharoCodeGenerator >> writeSelectorAndArguments: aMOMethodInvocation [

	| keywords |
	self nextPutAll: ' '.
	aMOMethodInvocation selector numArgs = 0 ifTrue: [ 
		self nextPutAll: aMOMethodInvocation selector.
		^ self ].
	aMOMethodInvocation selector asSymbol isKeyword
		ifTrue: [ 
			keywords := ':' split: aMOMethodInvocation selector.
			keywords removeLast.
			keywords with: aMOMethodInvocation arguments do: [ :key :arg | 
				self
					nextPutAll: ' ';
					nextPutAll: key;
					nextPutAll: ': ('.
				arg acceptVisitor: self.
				self nextPutAll: ')' ] ]
		ifFalse: [ 
			self assert: aMOMethodInvocation arguments size = 1.
			self nextPutAll: aMOMethodInvocation selector.
			self nextPutAll: ' '.
			aMOMethodInvocation arguments first acceptVisitor: self ]
]

{ #category : #writing }
MOPharoCodeGenerator >> writeSelectorAndParameters: aMOMethod [

	| keywords |
	self nextPutAll: ' '.
	aMOMethod selector numArgs = 0 ifTrue: [ 
		self nextPutAll: aMOMethod selector.
		^ self ].
	aMOMethod selector isKeyword
		ifTrue: [ 
			keywords := ':' split: aMOMethod selector.
			keywords removeLast.
			keywords with: aMOMethod parameters do: [ :key :arg | 
				self
					nextPutAll: ' ';
					nextPutAll: key;
					nextPutAll: ': '.
				arg acceptVisitor: self.
				stream nextPutAll: ' ' ] ]
		ifFalse: [ 
			self assert: aMOMethod parameters size = 1.
			self nextPutAll: aMOMethod selector.
			self nextPutAll: ' '.
			aMOMethod parameters first acceptVisitor: self ]
]
