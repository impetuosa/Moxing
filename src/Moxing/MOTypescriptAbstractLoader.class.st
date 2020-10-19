Class {
	#name : #MOTypescriptAbstractLoader,
	#superclass : #JSProgramNodeVisitor,
	#instVars : [
		'result',
		'file',
		'types'
	],
	#category : #'Moxing-ModelReading'
}

{ #category : #actions }
MOTypescriptAbstractLoader class >> load: aJSDecoratorExpressionNode file: aFile types: types [ 

	| loader |
	loader := self new.
	loader types: types .
	loader file: aFile.
	aJSDecoratorExpressionNode acceptVisitor: loader.
	loader result anchorFrom: aJSDecoratorExpressionNode at: aFile. 
	^ loader result
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> file: aFile [
	file := aFile 
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> result [
	^ result 
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> types: aSetOfTypes [
	types := aSetOfTypes
]
