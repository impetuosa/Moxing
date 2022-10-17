Class {
	#name : #MOConstructorInvocation,
	#superclass : #MOInvocation,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOConstructorInvocation >> acceptVisitor: aMOTransformationApplier [

	^ aMOTransformationApplier visitConstructorInvocation: self
]

{ #category : #accessing }
MOConstructorInvocation >> refersToObjectsLike: aMOClassProcedure [

	^ aMOClassProcedure canBeReferredAsConstructor
]
