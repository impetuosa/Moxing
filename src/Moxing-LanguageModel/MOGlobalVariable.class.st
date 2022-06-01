Class {
	#name : #MOGlobalVariable,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'#visibility => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOGlobalVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitGlobalVariable: self
]

{ #category : #visiting }
MOGlobalVariable >> canBeReferredAsAttribute [
	 ^ true 
]

{ #category : #visiting }
MOGlobalVariable >> kindString [

	^ 'GLOBAL VAR'
]

{ #category : #visiting }
MOGlobalVariable >> visibility [
	^ visibility
]

{ #category : #visiting }
MOGlobalVariable >> visibility: aString [
	visibility := aString
]
