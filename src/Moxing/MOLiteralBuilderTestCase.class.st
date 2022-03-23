Class {
	#name : #MOLiteralBuilderTestCase,
	#superclass : #MOBuilderTestCase,
	#category : #'Moxing-MicroBuilderTest'
}

{ #category : #'boolean literal' }
MOLiteralBuilderTestCase >> testBooleanLiteralTypeBuilder [

	| literal |
	literal := builder booleanLiteralBuilder
		           value: true;
		           build.
	self assert: literal isKindOf: MOBooleanLiteral 
]

{ #category : #'boolean literal' }
MOLiteralBuilderTestCase >> testBuildBooleanLiteral [

	self assert: (builder booleanLiteralBuilder
			 value: true;
			 build) literal
]

{ #category : #'boolean literal' }
MOLiteralBuilderTestCase >> testBuildBooleanLiteralWithNoneBoolean [
	self
		should: [ 
			builder booleanLiteralBuilder
				value: 'true';
				build ]
		raise: Error
]

{ #category : #'boolean literal' }
MOLiteralBuilderTestCase >> testBuildFalseBooleanLiteral [

	self assert: (builder booleanLiteralBuilder
			 value: false;
			 build) literal not 
]

{ #category : #'string literal' }
MOLiteralBuilderTestCase >> testBuildStringLiteralWithNonString [

	self
		should: [ 
			builder stringLiteralBuilder
				value: Object new;
				build ]
		raise: Error
]

{ #category : #'string literal' }
MOLiteralBuilderTestCase >> testBuildStringLiteralWithString [

	self
		assert: (builder stringLiteralBuilder
				 value: 'Hello';
				 build) literal
		equals: 'Hello'
]

{ #category : #'string literal' }
MOLiteralBuilderTestCase >> testBuildStringLiteralWithSymbol [

	self
		assert: (builder stringLiteralBuilder
				 value: #'Hello';
				 build) literal
		equals: #'Hello'
]

{ #category : #'boolean literal' }
MOLiteralBuilderTestCase >> testBuildTrueBooleanLiteral [

	self assert: (builder booleanLiteralBuilder
			 value: true;
			 build) literal
]

{ #category : #'number literal' }
MOLiteralBuilderTestCase >> testFloatLiteralBuilder [

	| literal |
	literal := builder numericLiteralBuilder
		           value: 10.6;
		           build.
	self assert: literal isKindOf: MOFloatLiteral
]

{ #category : #'number literal' }
MOLiteralBuilderTestCase >> testIntegerLiteralTypeBuilder [

	| literal |
	literal := builder numericLiteralBuilder
		           value: 10;
		           build.
	self assert: literal isKindOf: MOIntegerLiteral
]

{ #category : #'number literal' }
MOLiteralBuilderTestCase >> testNumericLiteralWithFloat [

	self
		assert: (builder numericLiteralBuilder
				 value: 40.3;
				 build) literal
		equals: 40.3
]

{ #category : #'number literal' }
MOLiteralBuilderTestCase >> testNumericLiteralWithInteger [

	self
		assert: (builder numericLiteralBuilder
				 value: 40;
				 build) literal
		equals: 40
]

{ #category : #'number literal' }
MOLiteralBuilderTestCase >> testNumericLiteralWithNonIntegerOrFloat [

	self
		should: [ 
			builder numericLiteralBuilder
				value: 40 / 3;
				build ]
		raise: Error
]

{ #category : #'string literal' }
MOLiteralBuilderTestCase >> testStringLiteralTypeBuilder [

	| literal |
	literal := builder stringLiteralBuilder
		           value: 'Literal';
		           build.
	self assert: literal isKindOf: MOStringLiteral
]
