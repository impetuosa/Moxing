Class {
	#name : #MOTypescriptCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Typescript-Writting'
}

{ #category : #visiting }
MOTypescriptCodeGenerator >> printClassHeader: name implements: types [

	stream nextPutAll: (' export class {1}  ' format: { name }).
	types ifNotEmpty: [ 
		stream
			nextPutAll: ' implements ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitClass: aJinTypescriptClass [
	aJinTypescriptClass dependencies do: [ :i | i acceptVisitor: self ].
	aJinTypescriptClass decorator
		ifNotNil: [ :d | d acceptVisitor: self ].
	self printClassHeader: aJinTypescriptClass name implements: aJinTypescriptClass types.
	
	stream
		nextPutAll: ' {';
		newLine.
	aJinTypescriptClass properties
		do: [ :m | 
			m acceptVisitor: self.
			stream
				nextPutAll: ';';
				newLine ].
	aJinTypescriptClass methods
		do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitDecorator: aJinTypescriptDecorator [

	stream
		cr;
		nextPutAll: '    ';
		nextPutAll: '@';
		nextPutAll: aJinTypescriptDecorator name;
		nextPutAll: '(';
		nextPutAll: (STONJSON toString: aJinTypescriptDecorator attributes);
		nextPutAll: ')';
		cr
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitDependency: aMOTypescriptImport [
	stream
		nextPutAll: 'import {';
		nextPutAll: (',' join: (aMOTypescriptImport types collect: [ :t | t name ]));
		nextPutAll: '} from "';
		nextPutAll: aMOTypescriptImport from;
		nextPutAll: '";';
		newLine
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
	aJinTypescriptMethod type acceptVisitor: self.
	aJinTypescriptMethod block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
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

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTemplatedConstructor: aMOTypescriptTemplatedConstructor [
	stream nextPutAll: 'constructor ('.
	aMOTypescriptTemplatedConstructor parameters allButLast
		do: [ :p | 
			p acceptVisitor: self.
			stream nextPutAll: ', ' ].
	aMOTypescriptTemplatedConstructor parameters last acceptVisitor: self.
	stream
		nextPutAll: '){ ';
		newLine;
		nextPutAll: aMOTypescriptTemplatedConstructor body;
		newLine;
		nextPutAll: '}'
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTemplatedMethod: aMOTypescriptTemplatedMethod [
	stream
		newLine;
		nextPutAll: '    ';
		nextPutAll: aMOTypescriptTemplatedMethod visibility;
		nextPutAll: ' ';
		nextPutAll: aMOTypescriptTemplatedMethod selector;
		nextPutAll: '('.
	stream
		nextPutAll:
			(','
				join:
					(aMOTypescriptTemplatedMethod parameters
						collect: [ :p | p name , ': ' , p type name ])).
	stream nextPutAll: ')'.
	aMOTypescriptTemplatedMethod type
		ifNotNil: [ :t | 
			stream
				nextPutAll: ': ';
				nextPutAll: t asString ].
	stream
		nextPutAll: ' {';
		newLine;
		nextPutAll: aMOTypescriptTemplatedMethod body;
		newLine;
		nextPutAll: '    }';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	stream
		nextPutAll: ': ';
		nextPutAll: aFylgjaMissingType name
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitVariable: aMOTypescriptVariable [

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.

	aMOTypescriptVariable type ifNotNil: [ 
		aMOTypescriptVariable type acceptVisitor: self ].
	aMOTypescriptVariable defaultValue ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable defaultValue acceptVisitor: self ]
]