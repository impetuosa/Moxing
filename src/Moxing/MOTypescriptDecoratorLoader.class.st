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
	types
		at: aCallExpression expression name value
		ifPresent: [ :v | 
			self assert: v isDecorator.
			^ result := v ].
	result := types values
		detect: [ :r | r name = aCallExpression expression name value ]
		ifFound: [ :r | 
			r isDecorator
				ifTrue: [ r ]
				ifFalse: [ types
						at: aCallExpression expression name value
						put:
							(MOTypescriptPrebuiltTypeReferenceFactory default
								decorator: aCallExpression expression name value
								definedAt: r definedAt
								attributes: Dictionary new) ] ]
		ifNone: [ types
				at: aCallExpression expression name value
				put:
					(MOTypescriptPrebuiltTypeReferenceFactory default
						decorator: aCallExpression expression name value
						definedAt: 'NONINFERRED'
						attributes: Dictionary new) ].
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
