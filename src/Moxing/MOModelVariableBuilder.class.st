Class {
	#name : #MOModelVariableBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'typeReference',
		'modifiers'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelVariableBuilder >> addModifier: aString [

	self modifiers add: aString
]

{ #category : #building }
MOModelVariableBuilder >> build [

	^ (self instantiate: MOVariable)
		  name: self name;
		  modifiers: self modifiers; 
		  typeReference: self typeReference;
		  yourself
]

{ #category : #accessing }
MOModelVariableBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
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
