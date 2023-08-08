"
I build foreach structures
"
Class {
	#name : #MOModelForEachBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'loopingBlock',
		'each',
		'collection'
	],
	#category : #'Moxing-Language-MicroBuilders-control flow'
}

{ #category : #'as yet unclassified' }
MOModelForEachBuilder >> buildsType [
<generated>
	^MOForEach
]

{ #category : #accessing }
MOModelForEachBuilder >> collection [ 

	^ collection ifNil: [  self error: 'Collection  is Nil' ]
]

{ #category : #accessing }
MOModelForEachBuilder >> collection: aMOVariableReference [ 
	collection := aMOVariableReference
]

{ #category : #accessing }
MOModelForEachBuilder >> each [
	^ each ifNil: [  self error: 'Each is Nil' ]
]

{ #category : #accessing }
MOModelForEachBuilder >> each: aMOVariableReference [ 
	each := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOModelForEachBuilder >> loadBuilderWithEntity: anEntity [ 
	self each: anEntity each. 
 self collection: anEntity collection. 
 self loopingBlock: anEntity loopingBlock. 
 
	
]

{ #category : #accessing }
MOModelForEachBuilder >> loopingBlock [
	^ loopingBlock ifNil: [  self error: 'Looping Block is Nil' ]
]

{ #category : #accessing }
MOModelForEachBuilder >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelForEachBuilder >> privateBuild [

	^ (self instantiate: MOForEach)
		  each: self each;
		  collection: self collection;
		  loopingBlock: self loopingBlock;
		  yourself
]
