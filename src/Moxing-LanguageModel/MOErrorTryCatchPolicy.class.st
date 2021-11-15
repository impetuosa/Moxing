Class {
	#name : #MOErrorTryCatchPolicy,
	#superclass : #MOErrorPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOErrorTryCatchPolicy class >> appliesToStatement: aStatement [

	^ { MOTryCatch } includes: aStatement class
]
