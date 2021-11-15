Class {
	#name : #MOInvocation,
	#superclass : #MOLanguageObject,
	#instVars : [
		'invocable',
		'arguments'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOInvocation >> acceptVisitor: aMOTransformationApplier [ 
	aMOTransformationApplier visitInvocation: self 
]

{ #category : #accessing }
MOInvocation >> arguments [
	^ arguments
]

{ #category : #accessing }
MOInvocation >> invocable [
	^ invocable
]

{ #category : #accessing }
MOInvocation >> invocable: aMOFunction [ 
	invocable := aMOFunction
]
