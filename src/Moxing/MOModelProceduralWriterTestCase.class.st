Class {
	#name : #MOModelProceduralWriterTestCase,
	#superclass : #TestCase,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOModelProceduralWriterTestCase >> setUp [
	| builder |
	super setUp.
	builder := MOModelBuilder new.
	builder model: MOModel new.
	builder model anchor: (MOAnchor on: #/).
	builder language:
		((MOLanguage newFor: builder model) name: 'TestLang') yourself.
	writer := MOModelWriter new. 
	writer model: builder model .
	writer builder: builder.
	
]

{ #category : #initialization }
MOModelProceduralWriterTestCase >> testWriteAPackageWithClassWithAttribueAndMethod [

	| package |
	package := writer writePackage: [ :com | 
		           com name: #com.
		           com writePackage: [ :bl | 
			           bl name: #bl.
			           bl writeClass: [ :myClass | 
				           myClass name: #Person.
				           myClass writeAttribute: [ :name | 
					           name
						           name: #name;
						           typeReference: (writer typeReferenceNamed: #String) ].
				           myClass writeAttribute: [ :birthDate | 
					           birthDate
						           name: #birthDate;
						           typeReference: (writer typeReferenceNamed: #Date) ].
				           myClass writeMethod: [ :getName | 
					           getName
						           selector: #getName;
						           returnTypeReference:
							           (writer typeReferenceNamed: #String);
						           writeBlock: [ :getNameBody | 
							           getNameBody writeStatement: [ :ret | 
									           ret return expression:
											           (writer variableReferenceNamed: #name) ] ] ].
				           myClass writeMethod: [ :getAge | 
					           getAge
						           selector: #getAge;
						           returnTypeReference:
							           (writer typeReferenceNamed: #Integer);
						           writeBlock: [ :getNameBody | 
							           getNameBody writeStatement: [ :st | 
									           st return expression:
											           (writer buildExpression: [ :builder | 
													            builder arithmeticOperatorBuilder
														            operator: #-;
														            right:
															            (writer variableReferenceNamed: #birthDate);
														            left: (builder methodInvocationBuilder
																             receiverReference:
																	             (writer typeReferenceNamed: #Date);
																             selector: #now;
																             build) ]) ] ] ] ] ] ].


	self assert: package name equals: #com.
	self assert: package subpackages size equals: 1.
	self assert: package subpackages first subpackages isEmpty.
	self assert: package subpackages first types size equals: 1.
	self
		assert: package subpackages first types first name
		equals: #Person.
	self
		assert: package subpackages first types first attributes size
		equals: 2.
	self
		assert: package subpackages first types first methods size
		equals: 2.
		
]
