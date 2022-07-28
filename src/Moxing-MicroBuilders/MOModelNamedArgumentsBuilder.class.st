Class {
	#name : #MOModelNamedArgumentsBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'argumentExpressions'
	],
	#category : #'Moxing-MicroBuilders-type-reference'
}

{ #category : #asserting }
MOModelNamedArgumentsBuilder >> argumentExpressions [
	 ^ argumentExpressions ifNil: [ self error: ' Cannot be nil ' ]
]

{ #category : #asserting }
MOModelNamedArgumentsBuilder >> argumentExpressions: anExpression [ 

	argumentExpressions := anExpression 
]

{ #category : #asserting }
MOModelNamedArgumentsBuilder >> buildsType [

	^ MONamedArguments
]

{ #category : #asserting }
MOModelNamedArgumentsBuilder >> name [
	^ name ifNil: [ self error: ' name cannot be nil ' ]
]

{ #category : #asserting }
MOModelNamedArgumentsBuilder >> name: aName [

	name := aName
]

{ #category : #asserting }
MOModelNamedArgumentsBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  name: self name;
		  argumentExpressions: self argumentExpressions;
		  yourself
]
