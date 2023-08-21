Class {
	#name : #MOVisualWorks,
	#superclass : #MOSmalltalk,
	#category : #'Moxing-StVisualWorks-Language'
}

{ #category : #accessing }
MOVisualWorks >> expressionTypeResolvingStrategy [

	^ MOVWExpressionTypeResolver
]

{ #category : #accessing }
MOVisualWorks >> name [

	^ #VisualWorks
]
