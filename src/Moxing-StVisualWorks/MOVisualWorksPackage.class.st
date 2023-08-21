Class {
	#name : #MOVisualWorksPackage,
	#superclass : #MOPackage,
	#instVars : [
		'#parcelDependancies => MOPropertySlot',
		'#comment => MOPropertySlot',
		'#parcelName => MOPropertySlot',
		'#version => MOPropertySlot',
		'#sharedVariables => MODeclaresSlot many'
	],
	#category : #'Moxing-StVisualWorks-Model'
}

{ #category : #accessing }
MOVisualWorksPackage >> acceptVisitor: aVisitor [
	 ^ aVisitor visitVisualWorksPackage: self 
]

{ #category : #accessing }
MOVisualWorksPackage >> comment [
	^ comment
]

{ #category : #accessing }
MOVisualWorksPackage >> comment: aString [

	comment := aString
]

{ #category : #accessing }
MOVisualWorksPackage >> parcelDependancies [
	^ parcelDependancies
]

{ #category : #accessing }
MOVisualWorksPackage >> parcelDependancies: aCollection [ 
	parcelDependancies := aCollection
]

{ #category : #accessing }
MOVisualWorksPackage >> parcelName [
	^ parcelName
]

{ #category : #accessing }
MOVisualWorksPackage >> parcelName: aString [ 
	parcelName := aString
]

{ #category : #accessing }
MOVisualWorksPackage >> sharedVariables [
	^ sharedVariables
]

{ #category : #accessing }
MOVisualWorksPackage >> sharedVariables: aCollection [

	sharedVariables := aCollection
]

{ #category : #accessing }
MOVisualWorksPackage >> version [
	^ version
]

{ #category : #accessing }
MOVisualWorksPackage >> version: aString [ 
	version := aString
]

{ #category : #accessing }
MOVisualWorksPackage >> writeSharedVariable: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOGlobalConstantWriter.
	^ stmnt
]
