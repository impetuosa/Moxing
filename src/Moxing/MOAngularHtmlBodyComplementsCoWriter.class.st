Class {
	#name : #MOAngularHtmlBodyComplementsCoWriter,
	#superclass : #Object,
	#instVars : [
		'brush',
		'writer'
	],
	#category : #Moxing
}

{ #category : #'as yet unclassified' }
MOAngularHtmlBodyComplementsCoWriter >> brush: aJinCasinoAngularSimpleBrush stream: aXMLWriter [ 
	brush := aJinCasinoAngularSimpleBrush .
	writer := aXMLWriter 
]

{ #category : #visiting }
MOAngularHtmlBodyComplementsCoWriter >> visitCSNAttribute: aCSNUITop [ 
		" Nothing to do here "
]

{ #category : #visiting }
MOAngularHtmlBodyComplementsCoWriter >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [

	" Nothing to do here "

	
]

{ #category : #visiting }
MOAngularHtmlBodyComplementsCoWriter >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	" Nothing to do here "
]

{ #category : #visiting }
MOAngularHtmlBodyComplementsCoWriter >> visitCSNUILabel: aCSNUILabel [ 
	self assert: brush isParagraph.
	writer string: aCSNUILabel attributeValue.	
	
]
