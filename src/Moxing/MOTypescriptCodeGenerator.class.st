Class {
	#name : #MOTypescriptCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #accessing }
MOTypescriptCodeGenerator >> initialize [
	super initialize.
	stream := '' writeStream
]

{ #category : #accessing }
MOTypescriptCodeGenerator >> sourceCode [
	^ stream contents 
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypescriptClass: aJinTypescriptClass [

	aJinTypescriptClass dependencies do: [ :i | i acceptVisitor: self ].
	aJinTypescriptClass decorator
		ifNotNil: [ :d | d acceptVisitor: self ].
	stream
		nextPutAll: (' export class {1}  ' format: {aJinTypescriptClass name}).
	aJinTypescriptClass types
		ifNotEmpty: [ stream
				nextPutAll: 'implements';
				nextPutAll: (',' join: (aJinTypescriptClass types collect: #name)) ].
	stream
		nextPutAll: ' {';
		newLine.
	aJinTypescriptClass properties
		do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
	aJinTypescriptClass methods
		do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypescriptDecorator: aJinTypescriptDecorator [

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

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTypescriptDependency: aMOTypescriptImport [
	stream
		nextPutAll: 'import {';
		nextPutAll: (',' join: (aMOTypescriptImport types collect: [ :t | t name ]));
		nextPutAll: '} from "';
		nextPutAll: aMOTypescriptImport from;
		nextPutAll: '";';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypescriptMethod: aJinTypescriptMethod [

	stream
		newLine;
		nextPutAll: '    ';
		nextPutAll: aJinTypescriptMethod selector;
		nextPutAll: '('.
	stream nextPutAll:
		(',' join: (aJinTypescriptMethod parameters collect: [ :p | 
				  p type name , ' ' , p name ])).
	stream
		nextPutAll: ') {';
		newLine;
		nextPutAll: '    }';
		newLine
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTypescriptTemplatedMethod: aMOTypescriptTemplatedMethod [
	stream
		newLine;
		nextPutAll: '    ';
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

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTypescriptVariable: aMOTypescriptVariable [
	stream
		nextPutAll: aMOTypescriptVariable name;
		nextPutAll: ': ';
		nextPutAll: aMOTypescriptVariable type name;
		nextPutAll: '; '
]
