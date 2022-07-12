Class {
	#name : #MOParameter,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'#isOptional => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOParameter >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitParameter: self
]

{ #category : #accessing }
MOParameter >> existsOnlyInParentContext [
	 ^ true 
]

{ #category : #accessing }
MOParameter >> isOptional: aBoolean [ 
	isOptional := aBoolean
]

{ #category : #accessing }
MOParameter >> kindString [

	^ 'PARAM'
]
