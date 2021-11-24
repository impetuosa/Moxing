Class {
	#name : #MOModelAttributeBuilder,
	#superclass : #MOModelVariableBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelAttributeBuilder >> build [

	^ (self instantiate: MOAttribute)
		  name: name;
		  typeReference: typeReference;
		  yourself
]
