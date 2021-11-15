Class {
	#name : #MOJavaCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Typescript-Writting'
}

{ #category : #visiting }
MOJavaCodeGenerator >> printClassHeader: name implements: types [

	stream nextPutAll: (' class {1} ' format: { name }).
	types ifNotEmpty: [ 
		stream
			nextPutAll: ' implements ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitClass: aJinTypescriptClass [

	aJinTypescriptClass dependencies do: [ :i | i acceptVisitor: self ].
	aJinTypescriptClass decorator ifNotNil: [ :d | d acceptVisitor: self ].

	stream nextPutAll: aJinTypescriptClass visibility asLowercase .
	self
		printClassHeader: aJinTypescriptClass name
		implements: aJinTypescriptClass types.

	stream
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aJinTypescriptClass properties do: [ :m | 
			m acceptVisitor: self.
			stream
				nextPutAll: ';';
				newLine ].
		aJinTypescriptClass methods do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
		stream nextPutAll: '}' ]
]

{ #category : #'as yet unclassified' }
MOJavaCodeGenerator >> visitDependency: aMOTypescriptImport [
	stream
		nextPutAll: 'import ';
		nextPutAll: (',' join: (aMOTypescriptImport types collect: [ :t | t name ]));
		nextPutAll: 'from "';
		nextPutAll: aMOTypescriptImport from;
		nextPutAll: '";';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitInvocation: aMOInvocation [

	self assert: (aMOInvocation invocable modifiers includes: #static).
	stream
		nextPutAll: aMOInvocation invocable fullSelector;
		nextPutAll: '('.
	self streamArguments: aMOInvocation arguments.
	stream nextPutAll: ')'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitMethod: aJinTypescriptMethod [

	self printIndentation.


	stream
		nextPutAll: aJinTypescriptMethod visibility;
		nextPutAll: ' '.
	aJinTypescriptMethod modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	aJinTypescriptMethod type acceptVisitor: self.
	stream
		nextPutAll: ' ';
		nextPutAll: aJinTypescriptMethod selector;
		nextPutAll: '('.
	self streamArguments: aJinTypescriptMethod parameters.


	stream nextPutAll: ') '.

	aJinTypescriptMethod block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResumeFromLabel: aMOResumeFromLabel [ 
	stream nextPutAll:' /** TODO RESUME FROM LABEL IS NOT A COMPATIBLE! */'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitReturnEmpty: aMOReturnEmpty [ 
	stream nextPutAll:'return'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitSelfReference: aMOSelf [

	stream nextPutAll: 'this'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTemplatedMethod: aMOTypescriptTemplatedMethod [

	stream
		newLine;
		nextPutAll: '    ';
		nextPutAll: aMOTypescriptTemplatedMethod visibility;
		nextPutAll: ' '.
	aMOTypescriptTemplatedMethod type acceptVisitor: self.
	stream
		nextPutAll: aMOTypescriptTemplatedMethod selector;
		nextPutAll: '('.
	stream nextPutAll:
		(',' join:
			 (aMOTypescriptTemplatedMethod parameters collect: [ :p | 
				  p name , ': ' , p type name ])).
	stream nextPutAll: ')'.


	stream
		nextPutAll: ' {';
		newLine;
		nextPutAll: aMOTypescriptTemplatedMethod body;
		newLine;
		nextPutAll: '    }';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	stream
		nextPutAll: aFylgjaMissingType name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitVariable: aMOTypescriptVariable [

	aMOTypescriptVariable type ifNotNil: [ 
		aMOTypescriptVariable type acceptVisitor: self.
		stream nextPutAll: ' ' ].

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.


	aMOTypescriptVariable defaultValue ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable defaultValue acceptVisitor: self ]
]
