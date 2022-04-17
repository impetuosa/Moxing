Class {
	#name : #MOPharoCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-StPharo'
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
MOPharoCodeGenerator >> lineDelimiter [
  ^'.'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitAssignment: aMOAssignment [
  aMOAssignment write acceptVisitor: self.
  stream
     nextPutAll: ' ';
     nextPutAll: ':=';
     nextPutAll: ' '.
  aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitAttribute: aMOAttribute [
  stream nextPutAll: aMOAttribute name
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitBlock: aMOBlock [
  | vars rest |
  vars := aMOBlock statements select: [:e |  e isVariable ].
  rest := aMOBlock statements reject: [:e |  e isVariable ].
  self printIndentation.
  vars ifNotEmpty: [ stream nextPutAll: '| '.
        stream nextPutAll: (' ' join: (vars collect: #name)).
        stream
           nextPutAll: ' |';
           newLine ].
  self increaseDeepDuring: [ rest do: [:s |  self printIndentation.
              s acceptVisitor: self.
              (self requiresTerminator: s) ifTrue: [ stream nextPutAll: self lineDelimiter ].
              stream newLine ] ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitBlockClosure: aMOStBlockClosure [
  stream nextPutAll: self blockDelimiterOpen.
  aMOStBlockClosure parameters do: [:p |  stream
           nextPutAll: ' :';
           nextPutAll: p name ].
  aMOStBlockClosure parameters ifNotEmpty: [ stream nextPutAll: ' |' ].
  aMOStBlockClosure block acceptVisitor: self.
  stream nextPutAll: self blockDelimiterClose
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitCharacterLiteral: aMOCharacterLiteral [
  aMOCharacterLiteral = Character space ifTrue: [ stream nextPutAll: 'Character space' ] ifFalse: [ stream
           nextPut: $$;
           nextPut: aMOCharacterLiteral literal ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [ 
	
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitFloatLiteral: aMOFloatLiteral [
  stream print: aMOFloatLiteral literal
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [
  aMOMethodInvocation receiverReference acceptVisitor: self.
  self writeSelectorAndArguments: aMOMethodInvocation
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitNullLiteral: aMONullLiteral [ 
	stream nextPutAll: 'nil'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitParameter: aMOParameter [
  stream nextPutAll: aMOParameter name
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitPragma: aMOPhPragma [
  stream nextPutAll: '<'.
  self writeSelectorAndParameters: aMOPhPragma.
  stream nextPutAll: '>'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitReturn: aMOReturn [

	stream nextPutAll: '^ '.
	aMOReturn expression acceptVisitor: self
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitSelfReference: aMOSelfReference [
  stream nextPutAll: 'self'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitSharedVariable: aMOSharedVariable [ 
  stream nextPutAll: aMOSharedVariable name
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStCascade: aMOStCascade [
  | first last rest |
  first := aMOStCascade invocations first.
  rest := aMOStCascade invocations allButFirst.
  last := rest last.
  rest remove: last.
  first acceptVisitor: self.
  stream
     nextPutAll: ';';
     newLine.
  self increaseDeepDuring: [ rest do: [:i |  self printIndentation.
              self writeSelectorAndArguments: i.
              stream
                 nextPutAll: ';';
                 newLine ].
        self printIndentation.
        self writeSelectorAndArguments: last ]
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStClass: aMOStClass [

	aMOStClass isPreexisting ifTrue: [ self halt. stream nextPutAll: 'Extension {#name : #'; nextPutAll: aMOStClass name; nextPutAll: '}'; newLine  ] ifFalse: [
	stream 
	nextPutAll: 'Class {'; newLine.
	self increaseDeepDuring: [
	self printIndentation.		
	stream nextPutAll: '#name: #''' ; nextPutAll: aMOStClass name; nextPutAll: '''' ; nextPutAll:' ,' ;newLine.
	self printIndentation.
	stream nextPutAll: '#superclass: #''' ; nextPutAll: aMOStClass superclassReference name; nextPutAll: ''''; nextPutAll:' ,' ;newLine.
	self printIndentation.
	stream nextPutAll: '#category: #''' ; nextPutAll: aMOStClass category; nextPutAll: ''''; nextPutAll:' ,' ;newLine.
	self printIndentation.
	
	stream nextPutAll:'#instVars: ['.
			self stream: aMOStClass instanceVariables splitingWith: [ stream nextPutAll: ', '; nextPutAll: String lf ] enclosingWith: [ stream nextPutAll: '''' ].
			self printIndentation.
	stream nextPutAll:'],' ;newLine.
	self printIndentation.
	
	stream nextPutAll:'#sharedVars: ['.
			self stream: aMOStClass sharedVariables splitingWith: [ stream nextPutAll: ', '; nextPutAll: String lf ] enclosingWith: [ stream nextPutAll: '''' ].
			self printIndentation.
	stream nextPutAll:'],' ;newLine.
self printIndentation.
	stream nextPutAll:'#classInstVars: [' .
		self stream: aMOStClass metaclass attributes splitingWith: [ stream nextPutAll: ', ' ] enclosingWith: [ stream nextPutAll: '''' ].
	stream nextPutAll:']';newLine.].
	stream newLine; nextPutAll: '}'; newLine.].
	self visitCollection: aMOStClass metaclass methods .
	self visitCollection: aMOStClass methods 
	
	
 
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStExensionMethodDeclarationUnit: aMOStExensionMethodDeclarationUnit [
  stream
     nextPutAll: 'Extension {#name : #';
     nextPutAll: aMOStExensionMethodDeclarationUnit classReference name;
     nextPutAll: '}';
     newLine.
  self visitCollection: aMOStExensionMethodDeclarationUnit extensionMethods.
  self visitCollection: aMOStExensionMethodDeclarationUnit extensionClassMethods
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitStMethod: aMOStMethod [
  stream
     newLine;
     nextPutAll: '{';
     nextPutAll: '#category:';
     nextPutAll: '''';
     nextPutAll: (aMOStMethod category ifNil: 'as yet to class');
     nextPutAll: '''';
     nextPutAll: '}';
     newLine.
  stream
     newLine;
     nextPutAll: aMOStMethod parent name;
     nextPutAll: '>>'.
  self writeSelectorAndParameters: aMOStMethod.
  stream
     nextPutAll: self blockDelimiterOpen;
     newLine.
  aMOStMethod block acceptVisitor: self.
  self printIndentation.
  stream
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
	stream
     nextPutAll: '''';
     nextPutAll: str;
     nextPutAll: ''''
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitSymbolicArrayLiteral: aMOSymbolicArrayLiteral [ 
	stream nextPutAll: '#('.
	stream nextPutAll: (	' ' join: 	aMOSymbolicArrayLiteral literal ).
	stream nextPutAll: ')'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitTypeReference: aMOTypeReference [
  stream nextPutAll: aMOTypeReference name
]

{ #category : #writing }
MOPharoCodeGenerator >> writeSelectorAndArguments: aMOMethodInvocation [
  | keywords |
  stream nextPutAll: ' '.
  aMOMethodInvocation selector numArgs = 0 ifTrue: [ stream nextPutAll: aMOMethodInvocation selector.
        ^self ].
  aMOMethodInvocation selector isKeyword ifTrue: [ keywords := ':' split: aMOMethodInvocation selector.
        keywords removeLast.
        keywords with: aMOMethodInvocation arguments do: [:key :arg |  stream
                 nextPutAll: ' ';
                 nextPutAll: key;
                 nextPutAll: ': ('.
              arg acceptVisitor: self.
              stream nextPutAll: ')' ] ] ifFalse: [ self assert: aMOMethodInvocation arguments size = 1.
        stream nextPutAll: aMOMethodInvocation selector.
        stream nextPutAll: ' '.
        aMOMethodInvocation arguments first acceptVisitor: self ]
]

{ #category : #writing }
MOPharoCodeGenerator >> writeSelectorAndParameters: aMOMethod [
   | keywords |
  stream nextPutAll: ' '.
  aMOMethod selector numArgs = 0 ifTrue: [ stream nextPutAll: aMOMethod selector.
        ^self ].
  aMOMethod selector isKeyword ifTrue: [ keywords := ':' split: aMOMethod selector.
        keywords removeLast.
        keywords with: aMOMethod parameters do: [:key :arg |  stream
                 nextPutAll: ' ';
                 nextPutAll: key;
                 nextPutAll: ': '.
              arg acceptVisitor: self.
              stream nextPutAll: ' ' ] ] ifFalse: [ self assert: aMOMethod parameters size = 1.
        stream nextPutAll: aMOMethod selector.
        stream nextPutAll: ' '.
        aMOMethod parameters first acceptVisitor: self ]
]
