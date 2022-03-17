Class {
	#name : #MOConstantReference,
	#superclass : #MOTypedReference,
	#instVars : [
		'#kind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #visiting }
MOConstantReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitConstantReference: self
]

{ #category : #accessing }
MOConstantReference >> kind: aString [

	kind := aString
]

{ #category : #'as yet unclassified' }
MOConstantReference >> refersToObjectsLike: aMOEnumEntry [

	^ aMOEnumEntry ifNil: [ true ] ifNotNil: [ 
		  { 
			  MOEnumEntry.
			  MOGlobalConstant.
			  MOLocalConstant.
			  MOConstantAttribute } includes: aMOEnumEntry species ]
]

{ #category : #generated }
MOConstantReference >> type [
	^ candidate type 
]