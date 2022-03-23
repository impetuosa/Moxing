Class {
	#name : #MOAlceForm,
	#superclass : #MOClass,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceForm >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitForm: self
]

{ #category : #visiting }
MOAlceForm >> canBeReferredAsVariable [ 
	 ^ true
]
