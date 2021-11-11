Class {
	#name : #MOTypescriptAbstractLoader,
	#superclass : #JSProgramNodeVisitor,
	#instVars : [
		'result',
		'file',
		'types',
		'anchor',
		'model',
		'parent'
	],
	#classInstVars : [
		'parent'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #actions }
MOTypescriptAbstractLoader class >> load: aJSDecoratorExpressionNode file: aFile anchor: anAnchor types: types model: aModel parent: aParent [

	| loader |
	loader := self new.
	loader types: types.
	loader file: aFile.
	loader anchor: anAnchor.
	loader model: aModel.
	loader parent: parent. 
	aJSDecoratorExpressionNode acceptVisitor: loader.
	loader result parent: aParent.
	^ loader result
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> anchor: anAnchor [
	anchor := anAnchor. 
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> file: aFile [
	file := aFile 
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> model: aModel [ 
	model := aModel
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> parent: aParent [

	parent := aParent
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> result [
	^ result 
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> types: aSetOfTypes [
	types := aSetOfTypes
]
