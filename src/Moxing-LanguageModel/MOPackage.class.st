Class {
	#name : #MOPackage,
	#superclass : #MOLanguageObject,
	#instVars : [
		'types'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOPackage >> acceptVisitor: aVisitor [

	aVisitor visitPackage: self
]

{ #category : #adding }
MOPackage >> addClass: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOPackage >> addClassType: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOPackage >> addType: aMOPrimitiveType [

	self assert:
		(types noneSatisfy: [ :t | t name = aMOPrimitiveType name ]).
	types add: aMOPrimitiveType
]

{ #category : #adding }
MOPackage >> fullName [

	^ ((parent isKindOf: MOPackage)
		   ifTrue: [ parent fullName , '.' ]
		   ifFalse: [ '' ]) , self name
]

{ #category : #adding }
MOPackage >> initialize [

	super initialize.
	types := OrderedCollection new.
]

{ #category : #adding }
MOPackage >> printOn: aStream [

	aStream
		nextPutAll: 'package: ';
		nextPutAll: self fullName
]

{ #category : #accessing }
MOPackage >> types [
	^ types
]
