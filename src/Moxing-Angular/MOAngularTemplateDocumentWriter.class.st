Class {
	#name : #MOAngularTemplateDocumentWriter,
	#superclass : #MOAngularDocumentWriter,
	#category : #'Moxing-Angular-Building'
}

{ #category : #writing }
MOAngularTemplateDocumentWriter >> initializeWriteBuilder [

	writeBuilder := builder templateDocumentBuilder
]

{ #category : #writing }
MOAngularTemplateDocumentWriter >> privateWriteToSurface: anEntity [

	surface template: anEntity
]
