Class {
	#name : #MOReturnEmpty,
	#superclass : #MOLanguageObject,
	#instVars : [
		'expression'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOReturnEmpty >> acceptVisitor: aVisitor [

	aVisitor visitReturnEmpty: self
]
