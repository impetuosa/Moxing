Class {
	#name : #MOReturnAssignmentPolicy,
	#superclass : #MOReturnPolicy,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOReturnAssignmentPolicy class >> appliesToStatement: aStatement [

	^ { 
		  MOExit.
		  MOReturnEmpty } includes: aStatement class
]
