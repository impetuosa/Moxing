Class {
	#name : #MOModelConstructorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'body',
		'parameters',
		'modifiers',
		'thrownTypeReferences',
		'visibility'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelConstructorBuilder >> addModifier: aString [ 
	self modifiers add: aString 
]

{ #category : #adding }
MOModelConstructorBuilder >> addParameter: aMOParameter [

	self parameters add: aMOParameter
]

{ #category : #adding }
MOModelConstructorBuilder >> addThrownTypeReference: aMOTypeReference [

	self thrownTypeReferences add: aMOTypeReference
]

{ #category : #accessing }
MOModelConstructorBuilder >> body [

	^ body ifNil: [ 
		  body := self
			          findInModel: [ :a | a isKindOf: MOEmptyBlock ]
			          ifNone: [ self instantiate: MOEmptyBlock ] ]
]

{ #category : #generated }
MOModelConstructorBuilder >> body: aMOBlock [  
	body := aMOBlock
]

{ #category : #adding }
MOModelConstructorBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
]

{ #category : #accessing }
MOModelConstructorBuilder >> modifiers: aCollection [ 
	modifiers := aCollection
]

{ #category : #generated }
MOModelConstructorBuilder >> parameters [

	^ parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> privateBuild [

	^ (self instantiate: MOConstructor)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  modifiers: self modifiers;
		  parameters: self parameters;
		  block: self body;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelConstructorBuilder >> thrownTypeReferences [

	^ thrownTypeReferences ifNil: [ 
		  thrownTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelConstructorBuilder >> thrownTypeReferences: aCollection [ 
	thrownTypeReferences := aCollection
]

{ #category : #accessing }
MOModelConstructorBuilder >> visibility [
	^ visibility
]

{ #category : #accessing }
MOModelConstructorBuilder >> visibility: aString [

	visibility := aString
]
