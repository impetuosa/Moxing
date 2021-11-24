Class {
	#name : #MOModelProcedureBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'body',
		'selector',
		'parameters'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelProcedureBuilder >> addParameter: aMOParameter [

	self parameters add: aMOParameter
]

{ #category : #generated }
MOModelProcedureBuilder >> body: aMOBlock [  
	body := aMOBlock
]

{ #category : #building }
MOModelProcedureBuilder >> build [

	^ (self instantiate: MOProcedure)
		  selector: selector;
		  parameters: self parameters;
		  block: body;
		  yourself
]

{ #category : #generated }
MOModelProcedureBuilder >> parameters [

	^ parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector: aString [ 
	selector := aString  
]
