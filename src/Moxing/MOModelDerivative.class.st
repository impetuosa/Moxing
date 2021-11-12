Class {
	#name : #MOModelDerivative,
	#superclass : #Object,
	#instVars : [
		'entities',
		'model'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOModelDerivative >> initialize [ 
	super initialize.
	entities := OrderedCollection new
]

{ #category : #'instance creation' }
MOModelDerivative >> instantiate: aClass [ 
	| instance | 
	instance := aClass newInstanceFromModel .
	entities add: instance.
	^ instance
]

{ #category : #accessing }
MOModelDerivative >> model: aMOModel [ 
	model := aMOModel
]
