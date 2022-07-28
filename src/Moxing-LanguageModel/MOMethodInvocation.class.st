Class {
	#name : #MOMethodInvocation,
	#superclass : #MOInvocation,
	#instVars : [
		'#receiverReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #generated }
MOMethodInvocation >> acceptVisitor: aMOTransformationApplier [

	^ aMOTransformationApplier visitMethodInvocation: self
]

{ #category : #accessing }
MOMethodInvocation >> isMethodInvocation [

	^ true
]

{ #category : #accessing }
MOMethodInvocation >> printOn: aStream [

	aStream
		nextPutAll: 'CALL ';
		print: receiverReference;
		nextPutAll: '.';
		nextPutAll: selector;
		nextPutAll: '\';
		nextPutAll: arguments size asString
]

{ #category : #accessing }
MOMethodInvocation >> receiverReference [
	^ receiverReference
]

{ #category : #accessing }
MOMethodInvocation >> receiverReference: aMOVariableReference [

	receiverReference := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOMethodInvocation >> refersToObjectsLike: aMOClassProcedure [

	^ aMOClassProcedure canBeReferredAsMethod
]

{ #category : #generated }
MOMethodInvocation >> type [
	^ candidate anyOne type 
]
