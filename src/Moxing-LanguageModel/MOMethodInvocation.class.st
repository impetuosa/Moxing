Class {
	#name : #MOMethodInvocation,
	#superclass : #MOInvocation,
	#instVars : [
		'receiver'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #generated }
MOMethodInvocation >> acceptVisitor: aMOTransformationApplier [ 
	aMOTransformationApplier visitMethodInvocation: self 
]

{ #category : #accessing }
MOMethodInvocation >> receiver: aMOVariableReference [ 
	receiver := aMOVariableReference
]

{ #category : #generated }
MOMethodInvocation >> type [
	^ candidates anyOne type 
]
