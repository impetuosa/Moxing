Class {
	#name : #MOModelWrapper,
	#superclass : #AlcixModel,
	#instVars : [
		'model'
	],
	#category : #'Moxing-Core'
}

{ #category : #'as yet unclassified' }
MOModelWrapper >> allTagCategories [
^ {  }
]

{ #category : #accessing }
MOModelWrapper >> model: aMOModel [ 
	model := aMOModel
]
