Class {
	#name : #MOModelMethodInvocationBuilder,
	#superclass : #MOModelInvocationBuilder,
	#instVars : [
		'receiverReference'
	],
	#category : #'Moxing-MicroBuilders'
}

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
		  receiverReference := self variableReferenceBuilder
			                       variable: (self instantiate: MOSelf);
			                       build ]
]

{ #category : #accessing }
MOModelMethodInvocationBuilder >> receiverReference: aMOVariableReference [ 
	receiverReference := aMOVariableReference
]
