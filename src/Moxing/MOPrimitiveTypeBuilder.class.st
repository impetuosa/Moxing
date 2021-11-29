Class {
	#name : #MOPrimitiveTypeBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOPrimitiveTypeBuilder >> name [

	^ name ifNil: [ self error: ' Name is Nil! ' ]
]

{ #category : #accessing }
MOPrimitiveTypeBuilder >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MOPrimitiveTypeBuilder >> privateBuild [

	^ (self instantiate: MOPrimitiveType)
		  name: self name;
		  parent: parentBuilder model;
		  yourself
]
