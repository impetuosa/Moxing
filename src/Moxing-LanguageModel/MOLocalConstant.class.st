Class {
	#name : #MOLocalConstant,
	#superclass : #MOLocalVariable,
	#instVars : [
		'#value => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOLocalConstant >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitLocalConstant: self
]

{ #category : #accessing }
MOLocalConstant >> kindString [

	^ 'LOCAL CONST'
]

{ #category : #accessing }
MOLocalConstant >> value [
	 ^ value 
]

{ #category : #accessing }
MOLocalConstant >> value: aValue [
 	value := aValue 
]
