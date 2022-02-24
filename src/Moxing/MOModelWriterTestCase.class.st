Class {
	#name : #MOModelWriterTestCase,
	#superclass : #MOMicroWriterTestCase,
	#category : #'Moxing-MicroWritersTest'
}

{ #category : #initialization }
MOModelWriterTestCase >> testWriteAPackageWithClassWithAttribueAndMethod [

	| package |
	package := writer writePackage: [ :bl | 
		           bl name: #bl.
		           bl writeClass: [ :myClass | 
			           myClass name: #Person.
			           myClass writeAttribute: [ :name | 
				           name
					           name: #name;
					           typeReference: (name typeReferenceNamed: #String) ].
			           myClass writeAttribute: [ :birthDate | 
				           birthDate
					           name: #birthDate;
					           typeReference: (birthDate typeReferenceNamed: #Date) ].
			           myClass writeMethod: [ :getName | 
				           getName
					           selector: #getName;
					           returnTypeReference:
						           (getName typeReferenceNamed: #String);
					           writeBlock: [ :getNameBody | 
						           getNameBody writeReturn: [ : return | 
								           return writeExpression: [ :expr | 
										           expr variableReferenceNamed: #name ] ] ] ].
			           myClass writeMethod: [ :getAge | 
				           getAge
					           selector: #getAge;
					           returnTypeReference:
						           (getAge typeReferenceNamed: #Integer);
					           writeBlock: [ :getNameBody | 
						           getNameBody writeReturn:  [ :return | 
								           return writeExpression: [ :expression | 
										           expression
											           operate: [ : opEx | 
												           opEx
													           invokeMethodNamed: #now
													           receiver: [ :expr | 
														           expr typeReferenceNamed: #Date ] ]
											           operator: #-
											           with: [ : opEx| 
												           opEx variableReferenceNamed: #birthDate ] ] ] ] ] ] ].


	self assert: package name equals: #bl.

	self assert: package allTypes size equals: 1.
	self assert: package allTypes first name equals: #Person.
	self assert: package allTypes first attributes size equals: 2.
	self assert: package allTypes first methods size equals: 2.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]
