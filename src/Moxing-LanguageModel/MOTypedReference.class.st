Class {
	#name : #MOTypedReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #generated }
MOTypedReference >> type [

	^ candidate constructingTypeName
]
