Class {
	#name : #MOLocalConstant,
	#superclass : #MOLocalVariable,
	#instVars : [
		'#value => MOExpressionSlot one',
		'#visibility => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOLocalConstant >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitLocalConstant: self
]

{ #category : #accessing }
MOLocalConstant >> kindString [

	^ 'CONST'
]

{ #category : #accessing }
MOLocalConstant >> value [
	 ^ value 
]

{ #category : #accessing }
MOLocalConstant >> value: aValue [
 	value := aValue 
]

{ #category : #accessing }
MOLocalConstant >> visibility [ 
	 ^ visibility 
]

{ #category : #accessing }
MOLocalConstant >> visibility: aVisibility [ 
	visibility := aVisibility 
]
