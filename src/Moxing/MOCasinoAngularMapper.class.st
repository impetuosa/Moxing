Class {
	#name : #MOCasinoAngularMapper,
	#superclass : #Object,
	#instVars : [
		'brush'
	],
	#category : #'Moxing-WidgetMapping'
}

{ #category : #accessing }
MOCasinoAngularMapper class >> default [
	^ self new 
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> brushFor: aCSNUIPanel [ 
	
	aCSNUIPanel accept: self.
	^ brush 

]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> newSimpleBrush [
	^ MOCasinoAngularSimpleBrush new
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNLAbsolutePositionLayout: aCSNLAbsolutePositionLayout [

	brush := MOCasinoAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNLTabulateLayout: aCSNLTabulateLayout [

	brush := MOCasinoAngularTabulatingLayoutBrush new
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUIButton: aCSNUIButton [
	brush := self newSimpleBrush
		tag: 'button';
		yourself
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUIImage: aCSNUIImage [
	brush := self newSimpleBrush
		tag: 'img';
		yourself
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNUIInputText: aCSNUIInputText [
	brush := self newSimpleBrush
		tag: 'input';
		yourself
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNUIPanel: aCSNUIPanel [
	brush := self newSimpleBrush
		tag: 'div';
		yourself
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNUIParagraph: aCSNUIParagraph [
	brush := self newSimpleBrush
		tag: 'p';
		yourself
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUISelect: aCSNUISelect [
	brush := self newSimpleBrush
		tag: 'select';
		yourself
]
