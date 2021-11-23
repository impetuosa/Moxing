Class {
	#name : #MOTypeMissingReference,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #generated }
MOTypeMissingReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitTypeMissingReference: self
]

{ #category : #'as yet unclassified' }
MOTypeMissingReference >> allVisibleMethods [
	^ {  }
]

{ #category : #generated }
MOTypeMissingReference >> printOn: aStream [

	aStream
		nextPutAll: '->';
		nextPutAll: ' UNKNOWN '
]

{ #category : #generated }
MOTypeMissingReference >> type [
	^ self
]
