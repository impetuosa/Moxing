Class {
	#name : #MOModelProcedureBuilder,
	#superclass : #MOModelConstructorBuilder,
	#instVars : [
		'selector'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> privateBuild [

	^ (self instantiate: MOProcedure)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  modifiers: self modifiers;
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
