Class {
	#name : #MOAngularCssDocumentWriter,
	#superclass : #MOAngularDocumentWriter,
	#category : #'Moxing-Angular-Building'
}

{ #category : #initialization }
MOAngularCssDocumentWriter >> initializeWriteBuilder [

	writeBuilder := builder cssDocumentBuilder
]

{ #category : #initialization }
MOAngularCssDocumentWriter >> privateWriteToSurface: anEntity [

	surface css: anEntity
]
