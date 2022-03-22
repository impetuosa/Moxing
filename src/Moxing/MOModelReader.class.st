Class {
	#name : #MOModelReader,
	#superclass : #Object,
	#instVars : [
		'read',
		'writer'
	],
	#category : #'Moxing-Reader'
}

{ #category : #accessing }
MOModelReader >> model: aModel [

	writer := aModel writer
]

{ #category : #'as yet unclassified' }
MOModelReader >> read: anEntity [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOModelReader >> readEntitysContextualizingRelation: anEntity [

	| relation |
	anEntity parent ifNil: [ 
		^ self readRelation:
			  (MODeclarationStructuralRelation nullRelationTo: anEntity) ].
	relation := anEntity parent allRelations select: [ :a | 
		            a to = anEntity ].
	self assert: relation size = 1.
	^ self readRelation: relation first
]

{ #category : #'as yet unclassified' }
MOModelReader >> readRelation: aRelation [

	^ writer shallowRelationCopy: aRelation
]

{ #category : #accessing }
MOModelReader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]
