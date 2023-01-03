Class {
	#name : #MOTypedReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #generated }
MOTypedReference >> isTypedReference [

	^ true
]

{ #category : #generated }
MOTypedReference >> type [

	^ referee constructingTypeName
]
