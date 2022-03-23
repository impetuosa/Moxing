Class {
	#name : #MOReturnPolicy,
	#superclass : #MOGrammaticalPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOReturnPolicy class >> appliesToStatement: aMOVariable [

	^ self allSubclasses anySatisfy: [ :a | 
		  a appliesToStatement: aMOVariable ]
]
