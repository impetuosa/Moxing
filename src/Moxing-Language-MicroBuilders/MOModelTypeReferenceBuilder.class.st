"
I build references to types 
"
Class {
	#name : #MOModelTypeReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'candidateAnchor',
		'candidate',
		'name',
		'parent',
		'packageReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Type-reference'
}

{ #category : #'as yet unclassified' }
MOModelTypeReferenceBuilder >> buildSubtypeReference [

	| parentType typeNames |
	self assert: self referee isNil.
	self assert: self candidateAnchor isNil.
	typeNames := '$' split: self name.
	parentType := (self instantiate: MOTypeReference)
		              referee: self referee;
		              name: typeNames first;
		              packageReference: self packageReference;
		              parent: self parent;
		              yourself.
	^ typeNames allButFirst
		  inject: parentType
		  into: [ :prev :eachName | 
			  (self instantiate: MOTypeReference)
				  name: eachName;
				  parent: self parent;
				  packageReference: prev;
				  yourself ]
]

{ #category : #'as yet unclassified' }
MOModelTypeReferenceBuilder >> buildTypeReference [

	^ (self instantiate: self buildsType)
		  refereeAnchor: self candidateAnchor;
		  referee: self referee;
		  name: self name;
		  packageReference: self packageReference;
		  parent: self parent;
		  yourself
]

{ #category : #asserting }
MOModelTypeReferenceBuilder >> buildsType [

	^ MOTypeReference
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> fullName: aString [

	| parts packageName |
	parts := '.' split: aString.

	self name: parts removeLast.
	packageName := '.' join: parts.

	packageReference := self packageReferenceBuilder
		                    packageName: packageName;
		                    build
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> name [ 
	^ name ifNil: [  self error: ' Type name is Nil! ' ]
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> packageReference [
	^ packageReference
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> parent [

	^ parent
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> parent: anObject [

	parent := anObject
]

{ #category : #'as yet unclassified' }
MOModelTypeReferenceBuilder >> privateBuild [

	^ self refersToSubtype
		  ifTrue: [ self buildSubtypeReference ]
		  ifFalse: [ self buildTypeReference ]
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> referee [

	^ candidate
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> referee: aMOClass [ 
	candidate := aMOClass 
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> refereeAnchor: aMOAnchor [

	candidateAnchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOModelTypeReferenceBuilder >> refersToSubtype [

	^ (name indexOf: $$) > 0
]

{ #category : #generated }
MOModelTypeReferenceBuilder >> type: aMOClass [
	self name: aMOClass name .
	self refereeAnchor: aMOClass anchor .
	self referee: aMOClass
]

{ #category : #'as yet unclassified' }
MOModelTypeReferenceBuilder >> unknownType [
	name := #UNKNOWN 
]
