Class {
	#name : #MOParametrizableClassType,
	#superclass : #MOClassType,
	#instVars : [
		'#typeParameters => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #generated }
MOParametrizableClassType >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitParametrizableClassType: self
]

{ #category : #generated }
MOParametrizableClassType >> isParametrizable [

	^ true
]

{ #category : #generated }
MOParametrizableClassType >> typeParameters [

	^ typeParameters
]

{ #category : #generated }
MOParametrizableClassType >> typeParameters: aCollection [

	typeParameters := aCollection
]
