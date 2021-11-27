Class {
	#name : #MOModelParameterBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'mapsToVariableArguments'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelParameterBuilder >> buildParameter [

	^ (self instantiate: MOParameter)
		  name: name;
		  typeReference: typeReference;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelParameterBuilder >> buildVariableArgumentsParameter [

	^ (self instantiate: MOVariableArgumentsParameter)
		  name: name;
		  typeReference: typeReference;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelParameterBuilder >> mapsToVariableArguments [

	^ mapsToVariableArguments ifNil: [ false ]
]

{ #category : #accessing }
MOModelParameterBuilder >> mapsToVariableArguments: aBoolean [ 
	mapsToVariableArguments := aBoolean
]

{ #category : #'as yet unclassified' }
MOModelParameterBuilder >> privateBuild [

	^ self mapsToVariableArguments
		  ifTrue: [ self buildVariableArgumentsParameter ]
		  ifFalse: [ self buildParameter ]
]
