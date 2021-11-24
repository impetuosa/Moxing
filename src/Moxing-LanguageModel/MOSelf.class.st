Class {
	#name : #MOSelf,
	#superclass : #MOLanguageObject,
	#instVars : [
		'class'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOSelf >> acceptVisitor: aMOJavaCodeGenerator [ 
	aMOJavaCodeGenerator visitSelfReference: self 
]

{ #category : #'as yet unclassified' }
MOSelf >> name [

	^ name ifNil: [ name := #self ]
]

{ #category : #initialization }
MOSelf >> setOwnerClass: aMOClass [

	class := aMOClass
]
