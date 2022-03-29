Class {
	#name : #MOReturnAssignmentPolicy,
	#superclass : #MOReturnPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOReturnAssignmentPolicy class >> appliesToStatement: aStatement [

	^ { 
		  MOAlceExit.
		  MOReturnEmpty } includes: aStatement class
]
