Class {
	#name : #MOParametrizableClass,
	#superclass : #MOClass,
	#instVars : [
		'#typeParameters => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOParametrizableClass >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitParametrizableClass: self
]

{ #category : #accessing }
MOParametrizableClass >> isParametrizable [

	^ true
]

{ #category : #accessing }
MOParametrizableClass >> typeParameters [
	^ typeParameters
]

{ #category : #accessing }
MOParametrizableClass >> typeParameters: aCollection [ 
	typeParameters := aCollection
]
