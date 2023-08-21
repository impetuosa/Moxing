"
i build method invocations 
"
Class {
	#name : #MOModelMethodInvocationBuilder,
	#superclass : #MOModelInvocationBuilder,
	#instVars : [
		'receiverReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Activation-reference'
}

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> buildsType [

	<generated>
	^ MOMethodInvocation
]

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self receiverReference: anEntity receiverReference
]

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> privateBuild [

	^ super privateBuild
		  receiverReference: self receiverReference;
		  yourself
]

{ #category : #accessing }
MOModelMethodInvocationBuilder >> receiverReference [

	^ receiverReference ifNil: [ 
		  self error: ' Receiver reference must be provided ' ]
]

{ #category : #accessing }
MOModelMethodInvocationBuilder >> receiverReference: aMOVariableReference [

	receiverReference := aMOVariableReference
]
