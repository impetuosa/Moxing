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
MOModelDerivative >> entities [
	^ entities
]

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

{ #category : #'as yet unclassified' }
MOModelDerivative >> swap: aMOExit with: aMOReturnEmpty context: aMOBlock [

	self assert: (entities includes: aMOExit).
	self assert: (model entities includes: aMOExit) not.
	entities replaceAll: aMOExit with: aMOReturnEmpty.
	aMOBlock statements replaceAll: aMOExit with: aMOReturnEmpty
]
