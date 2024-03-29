"
I represent the MOAccess language. 
"
Class {
	#name : #MOAccess,
	#superclass : #MOLanguage,
	#category : #'Moxing-Access-Language'
}

{ #category : #testing }
MOAccess >> astComposer [

	^ MoxingMicrosoftAccessAstComposer
]

{ #category : #testing }
MOAccess >> isMicrosoftAccess [
	^ true
]

{ #category : #accessing }
MOAccess >> link: aMOModelDerivative [

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
