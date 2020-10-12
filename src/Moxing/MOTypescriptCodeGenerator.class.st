Class {
	#name : #MOTypescriptCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #accessing }
MOTypescriptCodeGenerator >> sourceCode [
	^ stream contents 
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypescriptClass: aJinTypescriptClass [
	self assert: stream isNil.
	stream := '' writeStream.
	stream
		nextPutAll: 'import { OnInit, OnDestroy } from ''@angular/core'';';
		cr.
	aJinTypescriptClass imports do: [ :i | i acceptVisitor: self ].
	aJinTypescriptClass decorator
		ifNotNil: [ :d | d acceptVisitor: self ].
	stream
		nextPutAll: (' export class {1} implements ' format: {aJinTypescriptClass name});
		nextPutAll: (',' join: (aJinTypescriptClass types collect: #name));
		nextPutAll: ' {';
		newLine.
	aJinTypescriptClass properties do: [ :m | m acceptVisitor: self ].
	aJinTypescriptClass methods do: [ :m | m acceptVisitor: self ].
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
MOTypescriptCodeGenerator >> visitTypescriptVariable: aMOTypescriptVariable [
	stream
		nextPutAll: aMOTypescriptVariable name;
		nextPutAll: ': ';
		nextPutAll: aMOTypescriptVariable type name;
		nextPutAll: ';'
]
