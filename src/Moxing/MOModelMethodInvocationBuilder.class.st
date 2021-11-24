Class {
	#name : #MOModelMethodInvocationBuilder,
	#superclass : #MOModelInvocationBuilder,
	#instVars : [
		'receiverReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelMethodInvocationBuilder >> build [

	^ (self instantiate: MOMethodInvocation)
		  receiverReference: self receiverReference;
		  arguments: self arguments;
		  selector: selector;
		  yourself
]

{ #category : #accessing }
MOModelMethodInvocationBuilder >> receiverReference [

	^ receiverReference ifNil: [ 
		  receiverReference := self variableReferenceBuilder
			                       variable: (self instantiate: MOSelf);
			                       build ]
]

{ #category : #accessing }
MOModelMethodInvocationBuilder >> receiverReference: aMOVariableReference [ 
	receiverReference := aMOVariableReference
]
