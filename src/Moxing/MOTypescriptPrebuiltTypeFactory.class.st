Class {
	#name : #MOTypescriptPrebuiltTypeFactory,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #accessing }
MOTypescriptPrebuiltTypeFactory class >> Fdefault [
	^ default ifNil: [ default := self new ]
]

{ #category : #accessing }
MOTypescriptPrebuiltTypeFactory class >> default [
	^ default ifNil: [ default := self new  ]
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> arrayOf: aString [
	^ MOTypescriptArrayTypeReference new
		innerType: (self typeReference: aString);
		yourself
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> bigint [
	^ self typeReference: #bigint
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> date [
	^ self typeReference: #Date
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> genericType: aTypeName parameterType: aParameter [
	^ self genericType: aTypeName parameterTypes: { aParameter }.
	
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> genericType: aTypeName parameterTypes: parameters [
	^ MOTypescriptGenericTypeReference new
		name: aTypeName;
		parameters: (parameters collect: [ :p | self typeReference: p ]);
		yourself
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> number [
	^ self typeReference: #number
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> observable: aType [
	^ self genericType: #Observable parameterType: aType
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> observableAny [
	^ self observable: #any
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> observableArrayOf: aType [
	^ self observable: (self arrayOf: aType)
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> string [
	^ self typeReference: #string
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> typeReference: aString [
	^ aString isString
		ifTrue: [ MOTypescriptTypeReference new
				name: aString;
				yourself ]
		ifFalse: [ aString ]
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeFactory >> void [
	^ self typeReference: #void
]
