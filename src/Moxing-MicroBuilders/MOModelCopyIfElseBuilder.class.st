"
I am a special builder for copying if else nodes 
"
Class {
	#name : #MOModelCopyIfElseBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'build',
		'anchor'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #accessing }
MOModelCopyIfElseBuilder >> anchor [

	^ anchor
]

{ #category : #accessing }
MOModelCopyIfElseBuilder >> build: anObject [

	build := anObject
]

{ #category : #'as yet unclassified' }
MOModelCopyIfElseBuilder >> buildCopyOf: anIfElseProvenanceEntity readingValues: aChildDelegateLoadingBlock [

	| condition ifTrue ifFalse |

	build := self instantiate: MOIfElse.
	
	build anchor: anchor.
	" set temporary anchor "
	condition := aChildDelegateLoadingBlock
		             cull: build
		             cull: anIfElseProvenanceEntity condition.
	ifTrue := aChildDelegateLoadingBlock
		cull: build
		cull: anIfElseProvenanceEntity ifTrue.
	ifFalse := aChildDelegateLoadingBlock
		cull: build
		cull: anIfElseProvenanceEntity ifFalse.
	build condition: condition.
	build ifTrue: ifTrue. 
	build ifFalse: ifFalse. 
	^ build
]

{ #category : #'as yet unclassified' }
MOModelCopyIfElseBuilder >> privateBuild [

	^ build
]

{ #category : #'as yet unclassified' }
MOModelCopyIfElseBuilder >> useAnchor: aMOAnchor [

	anchor := aMOAnchor
]
