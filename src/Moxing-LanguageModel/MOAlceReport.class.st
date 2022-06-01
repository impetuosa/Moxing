Class {
	#name : #MOAlceReport,
	#superclass : #MOClass,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceReport >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitReport: self
]

{ #category : #visiting }
MOAlceReport >> canBeReferredAsVariable [

	^ true
]

{ #category : #visiting }
MOAlceReport >> isWidget [ 
 	 ^ true 
]
