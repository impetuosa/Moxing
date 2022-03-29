Class {
	#name : #MOErrorPolicy,
	#superclass : #MOGrammaticalPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOErrorPolicy class >> appliesToStatement: aMOVariable [

	^ self allSubclasses anySatisfy: [ :a | 
		  a appliesToStatement: aMOVariable ]
]
