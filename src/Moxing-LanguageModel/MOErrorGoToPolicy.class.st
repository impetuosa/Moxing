Class {
	#name : #MOErrorGoToPolicy,
	#superclass : #MOErrorPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOErrorGoToPolicy class >> appliesToStatement: aStatement [

	^ { 
		  MOOnErrorGoToLabel.
		  MOLabel } includes: aStatement class
]
