Class {
	#name : #MOModelSharedVariableBuilder,
	#superclass : #MOModelGlobalVariableBuilder,
	#instVars : [
		'isPreexisting'
	],
	#category : #'Moxing-StVisualWorks-builder'
}

{ #category : #testing }
MOModelSharedVariableBuilder >> buildsType [ 
	^ MOSharedVariable 
]

{ #category : #testing }
MOModelSharedVariableBuilder >> isPreexisting: aBoolean [

	isPreexisting := aBoolean
]
