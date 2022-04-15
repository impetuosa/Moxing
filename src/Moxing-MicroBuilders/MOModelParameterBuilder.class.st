"
I build parameters . I manage simple and multiple parameters 
"
Class {
	#name : #MOModelParameterBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'mapsToVariableArguments',
		'isOptional'
	],
	#category : #'Moxing-MicroBuilders-variables'
}

{ #category : #'as yet unclassified' }
MOModelParameterBuilder >> buildParameter [

	^ (self instantiate: MOParameter)
		  name: name;
		  bindingKind: self bindingKind;
		  initializer: self initializer;
		  typeReference: typeReference;
		  isOptional: self isOptional;
		  annotationInstances: self annotationInstances;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelParameterBuilder >> buildVariableArgumentsParameter [

	^ (self instantiate: MOVariableArgumentsParameter)
		  name: name;
		  bindingKind: self bindingKind;
		  initializer: self initializer;
		  typeReference: typeReference;
		  annotationInstances: self annotationInstances;
		  yourself
]

{ #category : #accessing }
MOModelParameterBuilder >> isOptional [
	^ isOptional
]

{ #category : #testing }
MOModelParameterBuilder >> isOptional: aBoolean [

	isOptional := aBoolean
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
