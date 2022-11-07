Class {
	#name : #MOParametrizableClass,
	#superclass : #MOJavaClass,
	#instVars : [
		'#typeParameters => MODeclaresSlot many'
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
