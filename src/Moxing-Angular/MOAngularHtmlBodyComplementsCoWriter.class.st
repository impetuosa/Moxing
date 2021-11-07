Class {
	#name : #MOAngularHtmlBodyComplementsCoWriter,
	#superclass : #Object,
	#instVars : [
		'brush',
		'writer'
	],
	#category : #'Moxing-Angular-Writting'
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
	writer string: aCSNUILabel attributeValue
]

{ #category : #'as yet unclassified' }
MOAngularHtmlBodyComplementsCoWriter >> visitDataBinding: aMODataBindingAttribute [
	brush writesBindingInBody
		ifTrue: [ | accessLine |
			accessLine := '{1}.{2}'
				format:
					{aMODataBindingAttribute binding entity parent compilableIdentifier.
					aMODataBindingAttribute binding entity compilableIdentifier}.
			writer string: '{{' , accessLine , '}}' ].
]
