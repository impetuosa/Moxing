Class {
	#name : #MOTemplatedMethod,
	#superclass : #MOMethod,
	#instVars : [
		'body',
		'dependentTypes'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOTemplatedMethod >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptTemplatedMethod: self 
]

{ #category : #'as yet unclassified' }
MOTemplatedMethod >> body [
	^ body
]

{ #category : #'as yet unclassified' }
MOTemplatedMethod >> body: aString [ 
	body := aString 
]

{ #category : #'as yet unclassified' }
MOTemplatedMethod >> dependencies [
	^ dependentTypes
		ifNil: [ super dependencies ]
		ifNotNil: [ super dependencies
				, (dependentTypes flatCollect: [ :dt | dt dependencies ]) ]
]

{ #category : #'as yet unclassified' }
MOTemplatedMethod >> dependsOn: aType [
	(dependentTypes ifNil: [ dependentTypes := OrderedCollection new ])
		add: aType
]
