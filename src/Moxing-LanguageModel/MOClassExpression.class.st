Class {
	#name : #MOClassExpression,
	#superclass : #MOTypeReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #'as yet unclassified' }
MOClassExpression >> refersToObjectsLike: aDeclarationObject [

	^ aDeclarationObject species = MOClass
]
