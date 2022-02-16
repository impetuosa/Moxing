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

	^ aMOTypescriptCodeGenerator visitVariableReference: self
]

{ #category : #accessing }
MOConstantReference >> kind: aString [

	kind := aString
]

{ #category : #generated }
MOConstantReference >> type [
	^ candidate type 
]
