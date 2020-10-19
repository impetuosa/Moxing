Class {
	#name : #MOCasinoAngularTabManagerBrush,
	#superclass : #Object,
	#category : #'Moxing-CodeWritingHtml'
}

{ #category : #'as yet unclassified' }
MOCasinoAngularTabManagerBrush >> write: aCSNUITabManager into: aXMLWriter with: aBlockClosure [
	aXMLWriter tag: 'mat-tab-group' with: [ aBlockClosure value ]
]
