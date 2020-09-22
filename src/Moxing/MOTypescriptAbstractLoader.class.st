Class {
	#name : #MOTypescriptAbstractLoader,
	#superclass : #JSProgramNodeVisitor,
	#instVars : [
		'result',
		'file'
	],
	#category : #'Moxing-ModelReading'
}

{ #category : #actions }
MOTypescriptAbstractLoader class >> load: aJSDecoratorExpressionNode file: aFile [ 

	| loader |
	loader := self new.
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
