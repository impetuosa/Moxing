Class {
	#name : #MOModelProcedureBuilder,
	#superclass : #MOModelConstructorBuilder,
	#instVars : [
		'selector'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelProcedureBuilder >> build [

	^ (self instantiate: MOProcedure)
		  selector: self selector;
		  parameters: self parameters;
		  block: self body;
		  yourself
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector [
	^ selector ifNil: [ self error: ' Selector is Nil ' ]
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector: aString [ 
	selector := aString  
]
