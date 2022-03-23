Class {
	#name : #MOReturnExpressionPolicy,
	#superclass : #MOReturnPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOReturnExpressionPolicy class >> appliesToStatement: aStatement [

	^ { MOReturn } includes: aStatement class
]
