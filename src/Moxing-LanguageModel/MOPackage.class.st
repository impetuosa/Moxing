Class {
	#name : #MOPackage,
	#superclass : #MOLanguageObject,
	#instVars : [
		'types',
		'subpackages'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOPackage >> acceptVisitor: aVisitor [

	aVisitor visitPackage: self
]

{ #category : #adding }
MOPackage >> addPackage: aMOPackage [

	subpackages add: aMOPackage
]

{ #category : #adding }
MOPackage >> addType: aMOPrimitiveType [ 
	types add: aMOPrimitiveType 
]

{ #category : #adding }
MOPackage >> initialize [

	super initialize.
	types := OrderedCollection new.
	subpackages := OrderedCollection new.
]

{ #category : #adding }
MOPackage >> printOn: aStream [

	aStream
		nextPutAll: 'package: ';
		nextPutAll: name
]

{ #category : #accessing }
MOPackage >> subpackages [
	^ subpackages
]

{ #category : #accessing }
MOPackage >> types [
	^ types
]
