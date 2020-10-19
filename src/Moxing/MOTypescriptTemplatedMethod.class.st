Class {
	#name : #MOTypescriptTemplatedMethod,
	#superclass : #MOTypescriptMethod,
	#instVars : [
		'body',
		'dependentTypes'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptTemplatedMethod: self 
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> body [
	^ body
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> body: aString [ 
	body := aString 
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> dependencies [
	^ dependentTypes
		ifNil: [ super dependencies ]
		ifNotNil: [ super dependencies
				, (dependentTypes flatCollect: [ :dt | dt dependencies ]) ]
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> dependsOn: aType [
	(dependentTypes ifNil: [ dependentTypes := OrderedCollection new ])
		add: aType
]
