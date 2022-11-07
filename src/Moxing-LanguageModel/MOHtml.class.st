Class {
	#name : #MOHtml,
	#superclass : #MOLanguage,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOHtml >> astComposer [

	^ MoxingHtmlAstComposer
]

{ #category : #testing }
MOHtml >> isHtml [
  ^ true
]

{ #category : #testing }
MOHtml >> name [

	^ #HTML
]

{ #category : #testing }
MOHtml >> parser [

	^ XMLHTMLParser
]
