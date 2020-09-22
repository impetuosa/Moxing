Class {
	#name : #MOTypescriptDecoratorLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#instVars : [
		'decorator',
		'currentProperty'
	],
	#category : #'Moxing-ModelReading'
}

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitArrayLiteral: aLiteral [
	self visitLiteral: aLiteral 
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitCallExpression: aCallExpression [

	result name: aCallExpression expression name value.
	aCallExpression arguments do: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitDecoratorExpression: aDecoratorExpression [
	result := MOTypescriptDecorator new. 
	aDecoratorExpression decorator acceptVisitor: self. 

]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitLiteral: aLiteral [
	self assert: currentProperty value = aLiteral.
	currentProperty value: aLiteral value value 
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitPropertyAssignment: aPropertyDefinition [

	result attributes
		at: aPropertyDefinition name name value
		put: aPropertyDefinition value.
	currentProperty := result attributes associationAt:
		                   aPropertyDefinition name name value.
	aPropertyDefinition value acceptVisitor: self.
	currentProperty := nil.
]
