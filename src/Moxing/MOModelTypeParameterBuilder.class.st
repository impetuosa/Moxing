Class {
	#name : #MOModelTypeParameterBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'superTypeReferences',
		'parent'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelTypeParameterBuilder >> addSuperTypeReference: aMOTypeReference [

	self superTypeReferences add: aMOTypeReference
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> fullName: aString [

	| parts |
	parts := '.' split: aString.

	self name: parts removeLast.

	parent := parts size > 1
		          ifTrue: [ 
			          self packageReferenceBuilder
				          packageFullName: ('.' join: parts);
				          build ]
		          ifFalse: [ 
			          self packageReferenceBuilder
				          packageName: parts first;
				          build ]
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> name [
	^ name ifNil: [  self error: ' NAme is Nil! ' ]
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> name: aString [

	name := aString
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> privateBuild [

	^ (self instantiate: MOTypeParameter)
		  name: self name;
		  parent: self parent; 
		  superTypeReferences: self superTypeReferences;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> superTypeReferences [

	^ superTypeReferences ifNil: [ 
		  superTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> superTypeReferences: aCollection [

	superTypeReferences := aCollection
]
