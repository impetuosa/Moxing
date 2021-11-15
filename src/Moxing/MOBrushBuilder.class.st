Class {
	#name : #MOBrushBuilder,
	#superclass : #Object,
	#instVars : [
		'brushClass',
		'map',
		'language',
		'policyMapping',
		'specializer'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #'as yet unclassified' }
MOBrushBuilder class >> brushClass: aClass language: aMOLanguage [

	^ self new
		  brushClass: aClass;
		  language: aMOLanguage;
		  yourself
]

{ #category : #accessing }
MOBrushBuilder >> brushClass: aBrushClass [

	brushClass := aBrushClass
]

{ #category : #building }
MOBrushBuilder >> build [

	^ self buildWith: specializer
]

{ #category : #'as yet unclassified' }
MOBrushBuilder >> buildSpecializedFor: aMOFunction [

	specializer subject: aMOFunction.
	specializer specialize: self.
	^ self build
]

{ #category : #building }
MOBrushBuilder >> buildWith: aFylgjaBrushSpecializer [

	| instance |
	instance := brushClass new.
	map values do: [ :val | val specializer: aFylgjaBrushSpecializer ].
	instance innerBrushMapping: map.
	instance policyTransformationMapping: policyMapping.
	^ instance
]

{ #category : #accessing }
MOBrushBuilder >> initialize [

	super initialize.
	map := Dictionary new.
	policyMapping := Dictionary new. 
]

{ #category : #accessing }
MOBrushBuilder >> language: aMOLanguage [

	language := aMOLanguage
]

{ #category : #accessing }
MOBrushBuilder >> map: aClassType to: aBrushClass [

	map at: aClassType put: aBrushClass 
]

{ #category : #'as yet unclassified' }
MOBrushBuilder >> mapping: aCategoryPolicy to: aConcretePolicy with: aTransformer [

	" The mapping of grammatical policies take place only if the destination language can use the concrete policy.  "

	(language grammarPolicies anySatisfy: [ :policy | 
		 policy isRepresentedBy: aConcretePolicy ]) ifTrue: [ 
		(policyMapping at: aCategoryPolicy ifAbsentPut: [ Dictionary new ])
			at: aConcretePolicy
			put: aTransformer ]
]

{ #category : #'as yet unclassified' }
MOBrushBuilder >> specializer: aFylgjaBrushSpecializer [

	specializer := aFylgjaBrushSpecializer
]

{ #category : #'as yet unclassified' }
MOBrushBuilder >> writesClass [
	^ brushClass writesClass
]

{ #category : #'as yet unclassified' }
MOBrushBuilder >> writesInvocableBehaviour [
	^ brushClass writesInvocableBehaviour
]
