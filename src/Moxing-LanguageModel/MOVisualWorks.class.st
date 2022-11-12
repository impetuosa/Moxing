Class {
	#name : #MOVisualWorks,
	#superclass : #MOSmalltalk,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOVisualWorks >> expressionTypeResolvingStrategy [

	^ MOVWExpressionTypeResolver
]

{ #category : #accessing }
MOVisualWorks >> name [

	^ #VisualWorks
]
