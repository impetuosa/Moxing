Class {
	#name : #MOLanguageSpecific,
	#superclass : #SubclassResponsibility,
	#category : #'Moxing-Linking'
}

{ #category : #printing }
MOLanguageSpecific >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self selector.
		stream << ' Is Language specific resolution. Please extend and override the method '.
		 ]
]
