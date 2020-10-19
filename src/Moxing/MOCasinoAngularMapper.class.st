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

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	brush := self newSimpleBrush
		tag: 'input';
		type: 'checkbox';
		yourself
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUIInputFile: aCSNUIInputFile [
	brush := self newSimpleBrush
		tag: 'input';
		type: 'file';
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

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUITab: aCSNUITab [
	brush := self newSimpleBrush
		tag: 'mat-tab';
		yourself
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitCSNUITabManager: aCSNUITabManager [
	brush := MOCasinoAngularTabManagerBrush new
]

{ #category : #'as yet unclassified' }
MOCasinoAngularMapper >> visitJinCasinoWidgetUsage: aJinCasinoWidgetUsage [
	brush := self newSimpleBrush
		tag: aJinCasinoWidgetUsage widgetName asLowercase;
		yourself
]
