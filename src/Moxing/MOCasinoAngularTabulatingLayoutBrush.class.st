Class {
	#name : #MOCasinoAngularTabulatingLayoutBrush,
	#superclass : #Object,
	#category : #'Moxing-CodeWritingHtml'
}

{ #category : #writing }
MOCasinoAngularTabulatingLayoutBrush >> write: aCSNLAbsolutePositionLayout into: aXMLWriter with: aFullBlockClosure [

	aXMLWriter tag: 'tbody' with: [ 
		aCSNLAbsolutePositionLayout rowsDo: [ :row | 
			aXMLWriter tag: 'tr' with: [ 
				row do: [ :cell | 
					aXMLWriter tag: 'td' with: [ aFullBlockClosure value: cell widget ] ] ] ] ]
]
