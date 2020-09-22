Class {
	#name : #MOCasinoAngularMapper,
	#superclass : #Object,
	#instVars : [
		'mapping',
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
MOCasinoAngularMapper >> initialize [

	super initialize.
	mapping := Dictionary new.
	self loadDefaults
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> loadDefaults [ 
	
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNLAbsolutePositionLayout: aCSNLAbsolutePositionLayout [

	brush := MOCasinoAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNLTabulateLayout: aCSNLTabulateLayout [

	brush := MOCasinoAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNUIInputText: aCSNUIInputText [

	brush := MOCasinoAngularSimpleBrush new
		         tag: 'input';
		         yourself
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNUIPanel: aCSNUIPanel [

	brush := MOCasinoAngularSimpleBrush new
		         tag: 'div';
		         yourself
]

{ #category : #visiting }
MOCasinoAngularMapper >> visitCSNUIParagraph: aCSNUIParagraph [

	brush :=  MOCasinoAngularSimpleBrush new
		  tag: 'p';
		  yourself
]
