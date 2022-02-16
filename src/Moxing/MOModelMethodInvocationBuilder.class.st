"
i build method invocations 
"
Class {
	#name : #MOModelMethodInvocationBuilder,
	#superclass : #MOModelInvocationBuilder,
	#instVars : [
		'receiverReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> bindingConfiguration [

	"On the left the attribute names for MOMethodInvocation. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #receiverReference. #receiverReference }.
		  { #arguments. #arguments }.
		  { #selector. #selector } }
]

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> buildsType [

	<generated>
	^ MOMethodInvocation
]

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> loadBuilderWithEntity: anEntity [

	self receiverReference: anEntity receiverReference.
	self arguments: anEntity arguments.
	self selector: anEntity selector
]

{ #category : #'as yet unclassified' }
MOModelMethodInvocationBuilder >> privateBuild [

	^ (self instantiate: MOMethodInvocation)
		  receiverReference: self receiverReference;
		  arguments: self arguments;
		  selector: self selector;
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
