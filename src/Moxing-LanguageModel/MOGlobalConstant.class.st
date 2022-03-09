Class {
	#name : #MOGlobalConstant,
	#superclass : #MOGlobalVariable,
	#instVars : [
		'#value => MOExpressionSlot one',
		'#visibility => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOGlobalConstant >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitGlobalConstant: self
]
