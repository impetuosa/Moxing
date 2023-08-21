Class {
	#name : #MOModelNamedSingleArgumentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'argumentExpression'
	],
	#category : #'Moxing-Language-MicroBuilders-Type-reference'
}

{ #category : #asserting }
MOModelNamedSingleArgumentBuilder >> argumentExpression [
	 ^ argumentExpression ifNil: [ self error: ' Cannot be nil ' ]
]

{ #category : #asserting }
MOModelNamedSingleArgumentBuilder >> argumentExpression: anExpression [ 

	argumentExpression := anExpression 
]

{ #category : #asserting }
MOModelNamedSingleArgumentBuilder >> buildsType [

	^ MONamedSingleArgument
]

{ #category : #asserting }
MOModelNamedSingleArgumentBuilder >> name [
	^ name ifNil: [ self error: ' name cannot be nil ' ]
]

{ #category : #asserting }
MOModelNamedSingleArgumentBuilder >> name: aName [

	name := aName
]

{ #category : #asserting }
MOModelNamedSingleArgumentBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  name: self name;
		  argumentExpression: self argumentExpression;
		  yourself
]
