Class {
	#name : #MOCompositeBrush,
	#superclass : #MOBrush,
	#instVars : [
		'innerBrushMapping'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #'as yet unclassified' }
MOCompositeBrush >> applyTransformationsIfAnyOn: aMOJavaModelWriter [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MOCompositeBrush >> delegateWritting: aMOSelf into: aMOJavaModelWriter [


	innerBrushMapping keys
		detect: [ :d | aMOSelf isKindOf: d ]
		ifFound: [ :key | 
			aMOJavaModelWriter brush:
				((innerBrushMapping at: key) buildSpecializedFor: aMOSelf).
			aMOJavaModelWriter write: aMOSelf.
			aMOJavaModelWriter brush: self ]
]

{ #category : #accessing }
MOCompositeBrush >> innerBrushMapping: aCollection [ 
	innerBrushMapping := aCollection
]
