Class {
	#name : #MOModelNamedArgumentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'argumentExpression'
	],
	#category : #'Moxing-MicroBuilders-type-reference'
}

{ #category : #asserting }
MOModelNamedArgumentBuilder >> argumentExpression [
	 ^ argumentExpression ifNil: [ self error: ' Cannot be nil ' ]
]

{ #category : #asserting }
MOModelNamedArgumentBuilder >> argumentExpressions: anExpression [ 

	argumentExpression := anExpression 
]

{ #category : #asserting }
MOModelNamedArgumentBuilder >> buildsType [

	^ MONamedArgument
]

{ #category : #asserting }
MOModelNamedArgumentBuilder >> name [
	^ name ifNil: [ self error: ' name cannot be nil ' ]
]

{ #category : #asserting }
MOModelNamedArgumentBuilder >> name: aName [

	name := aName
]

{ #category : #asserting }
MOModelNamedArgumentBuilder >> privateBuild [

	^ (self instantiate: MONamedArgument)
		  name: self name;
		  argumentExpressions: self argumentExpression;
		  yourself
]
