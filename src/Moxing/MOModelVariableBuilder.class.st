Class {
	#name : #MOModelVariableBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'typeReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelVariableBuilder >> build [

	^ (self instantiate: MOVariable)
		  name: name;
		  typeReference: self typeReference;
		  yourself
]

{ #category : #accessing }
MOModelVariableBuilder >> name: aString [ 
	name := aString 
]

{ #category : #accessing }
MOModelVariableBuilder >> type: aMOClass [

	self typeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelVariableBuilder >> typeReference [

	^ typeReference ifNil: [ 
		  typeReference := self typeReferenceBuilder
			                   unknownType;
			                   build ]
]

{ #category : #accessing }
MOModelVariableBuilder >> typeReference: aMOTypeReference [

	typeReference := aMOTypeReference
]
