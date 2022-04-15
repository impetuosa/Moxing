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
MOPharoCodeGenerator >> visitMethod: aMOMethod [

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
  self writeSelectorAndArguments: aMOPhPragma.
  stream nextPutAll: '>'
]

{ #category : #visiting }
MOPharoCodeGenerator >> visitSelfReference: aMOSelfReference [
  stream nextPutAll: 'self'
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
			self stream: aMOStClass attributes splitingWith: [ stream nextPutAll: ', '; nextPutAll: String lf ] enclosingWith: [ stream nextPutAll: '''' ].
			self printIndentation.
	stream nextPutAll:'],' ;newLine.
self printIndentation.
	stream nextPutAll:'#classInstVars: [' .
		self stream: aMOStClass metaclass attributes splitingWith: [ stream nextPutAll: ', ' ] enclosingWith: [ stream nextPutAll: '''' ].
	stream nextPutAll:']';newLine.].
	stream newLine; nextPutAll: '}'; newLine.
	self visitCollection: aMOStClass metaclass methods .
	self visitCollection: aMOStClass methods 
	
	
 
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

	str := ((aMOStringLiteral literal beginsWith: '''') and: [ 
		        aMOStringLiteral literal endsWith: '''' ])
		       ifTrue: [ 
			       aMOStringLiteral literal
				       copyFrom: 2
				       to: aMOStringLiteral literal size - 1 ]
		       ifFalse: [ aMOStringLiteral literal ].
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
MOPharoCodeGenerator >> writeSelector: selector withCollection: aCollection [
  | keywords |
  stream nextPutAll: ' '.
  keywords := ':' split: selector.
  keywords size = 1 ifTrue: [ stream nextPutAll: selector.
        ^self ].
  keywords removeLast.

  keywords with: aCollection do: [:key :arg |  
			stream
           nextPutAll: ' ';
           nextPutAll: key;
           nextPutAll: ': '.
        arg acceptVisitor: self 
 ]
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
  self writeSelector: aMOMethod selector withCollection: aMOMethod parameters
]
