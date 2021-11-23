Class {
	#name : #MOModelBuilder,
	#superclass : #Object,
	#instVars : [
		'model',
		'language'
	],
	#category : #Moxing
}

{ #category : #'instance creation' }
MOModelBuilder >> instantiate: aLangClass [

	^ (model instantiate: aLangClass)
		  language: language;
		  yourself
]
