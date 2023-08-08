"
I am a special builder for copying assignments 
"
Class {
	#name : #MOModelCopyAssignmentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'build',
		'anchor'
	],
	#category : #'Moxing-Language-MicroBuilders-core'
}

{ #category : #accessing }
MOModelCopyAssignmentBuilder >> anchor [

	^ anchor
]

{ #category : #accessing }
MOModelCopyAssignmentBuilder >> build: anObject [

	build := anObject
]

{ #category : #'as yet unclassified' }
MOModelCopyAssignmentBuilder >> buildCopyOf: aProvenanceAssignmentEntity readingValues: aChildDelegateLoadingBlock [

	| read write |
	build := self instantiate: MOAssignment.
	build anchor: anchor.
	" set temporary anchor "
	read := aChildDelegateLoadingBlock cull: build cull: aProvenanceAssignmentEntity read.
	write := aChildDelegateLoadingBlock cull: build cull: aProvenanceAssignmentEntity write.
	build read: read.
	build write: write.
	^ build
]

{ #category : #accessing }
MOModelCopyAssignmentBuilder >> privateBuild [

	^ build
]

{ #category : #'as yet unclassified' }
MOModelCopyAssignmentBuilder >> useAnchor: aMOAnchor [

	anchor := aMOAnchor
]
