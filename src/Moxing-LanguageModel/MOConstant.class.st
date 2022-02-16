Class {
	#name : #MOConstant,
	#superclass : #MOVariable,
	#instVars : [
		'#value => MOExpressionSlot one',
		'#visibility => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOConstant >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitConstant: self
]

{ #category : #accessing }
MOConstant >> value [
	 ^ value 
]

{ #category : #accessing }
MOConstant >> value: aValue [
 	value := aValue 
]

{ #category : #accessing }
MOConstant >> visibility [ 
	 ^ visibility 
]

{ #category : #accessing }
MOConstant >> visibility: aVisibility [ 
	visibility := aVisibility 
]
