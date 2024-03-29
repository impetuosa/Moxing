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

{ #category : #generated }
MOConstantReference >> canBeReferredAsArrayAccess [

	^ true
]

{ #category : #accessing }
MOConstantReference >> kind: aString [

	kind := aString
]

{ #category : #'as yet unclassified' }
MOConstantReference >> refersToObjectsLike: aMOEnumEntry [

	^ aMOEnumEntry canBeReferredAsConstant
]

{ #category : #generated }
MOConstantReference >> type [
	^ referee type 
]
