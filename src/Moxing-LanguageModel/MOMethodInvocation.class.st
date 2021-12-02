Class {
	#name : #MOMethodInvocation,
	#superclass : #MOInvocation,
	#instVars : [
		'receiverReference'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #generated }
MOMethodInvocation >> acceptVisitor: aMOTransformationApplier [ 
	aMOTransformationApplier visitMethodInvocation: self 
]

{ #category : #accessing }
MOMethodInvocation >> receiverReference [
	^ receiverReference
]

{ #category : #accessing }
MOMethodInvocation >> receiverReference: aMOVariableReference [

	receiverReference := aMOVariableReference
]

{ #category : #generated }
MOMethodInvocation >> type [
	^ candidate anyOne type 
]
