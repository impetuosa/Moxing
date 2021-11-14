Class {
	#name : #MOSelf,
	#superclass : #MOLanguageObject,
	#instVars : [
		'class'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #initialization }
MOSelf >> setOwnerClass: aMOClass [

	class := aMOClass
]
