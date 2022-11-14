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

	^ writer arrayLiteral:
		  (aLiteral expressions collect: [ :a | a value value ]) asArray
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitCallExpression: aCallExpression [

	writer decoratorTypeReference:
		(writer typeReferenceNamed: aCallExpression expression name value).
	writer arguments:
		(aCallExpression arguments collect: [ :a | a acceptVisitor: self ])
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitDecoratorExpression: aDecoratorExpression [
	aDecoratorExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitLiteral: aLiteral [

	^ writer literalForValue: aLiteral value value
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitObjectLiteral: anObjectLiteral [

	^ writer dictionaryLiteralWithLiterals:
		  (anObjectLiteral definitions collect: [ :a | 
			   a name name value -> (a value acceptVisitor: self) ])
			  asDictionary
]

{ #category : #visiting }
MOTypescriptDecoratorLoader >> visitPropertyAssignment: aPropertyDefinition [

	^ writer writeUnregisteredExpression: [ :ue | 
		  ue
			  singleArgumentNamed: aPropertyDefinition name source
			  expression: [ :e | 
				  self
					  use: e
					  during: [ { (aPropertyDefinition value acceptVisitor: self) } ] ] ]
]
