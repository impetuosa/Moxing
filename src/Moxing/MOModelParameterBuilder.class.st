Class {
	#name : #MOModelParameterBuilder,
	#superclass : #MOModelVariableBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelParameterBuilder >> build [

	^ (self instantiate: MOParameter)
		  name: name;
		  typeReference: typeReference;
		  yourself
]
