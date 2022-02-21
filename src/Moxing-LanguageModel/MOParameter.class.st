Class {
	#name : #MOParameter,
	#superclass : #MOVariable,
	#instVars : [
		'isOptional'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOParameter >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitParameter: self
]

{ #category : #accessing }
MOParameter >> isOptional: aBoolean [ 
	isOptional := aBoolean
]

{ #category : #accessing }
MOParameter >> kindString [

	^ 'PARAM'
]
