Class {
	#name : #MOAccess,
	#superclass : #MOLanguage,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOAccess >> astComposer [

	^ MoxingMicrosoftAccessAstComposer
]

{ #category : #testing }
MOAccess >> isMicrosoftAccess [
	^ true
]

{ #category : #testing }
MOAccess >> name [

	^ #MicrosoftAccess
]

{ #category : #testing }
MOAccess >> newCodeTextWriter [

	^ MOMicrosoftAccessCodeGenerator new
]

{ #category : #testing }
MOAccess >> parser [

	^ VBParser
]

{ #category : #testing }
MOAccess >> style [

	^ MOVBAStyle new
]
