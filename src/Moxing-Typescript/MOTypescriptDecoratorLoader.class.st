Class {
	#name : #MOTypescriptDecoratorLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#instVars : [
		'decorator',
		'currentProperty'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #accessing }
MOTypescriptDecoratorLoader >> loadArtefact: anAstNode [

	^ writer writeDecorator: [ :decorator | 
		  self use: decorator during: [ anAstNode acceptVisitor: self ] ]
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitArrayLiteral: aLiteral [
	self visitLiteral: aLiteral 
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitCallExpression: aCallExpression [

	writer name: aCallExpression expression name value.
	aCallExpression arguments do: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitDecoratorExpression: aDecoratorExpression [
	aDecoratorExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitLiteral: aLiteral [
	self halt. 
	self assert: currentProperty value = aLiteral.
	currentProperty value: aLiteral value value 
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitPropertyAssignment: aPropertyDefinition [

	writer
		property: aPropertyDefinition name name value
		value: aPropertyDefinition value source
]
