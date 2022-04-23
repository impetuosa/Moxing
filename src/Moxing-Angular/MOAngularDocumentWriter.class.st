Class {
	#name : #MOAngularDocumentWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-Angular-Building'
}

{ #category : #'as yet unclassified' }
MOAngularDocumentWriter >> acceptWritingVisitor: aVisistor [

	^ aVisistor visitDocumentWriter: self
]

{ #category : #writing }
MOAngularDocumentWriter >> document: aDocuemnt [

	writeBuilder document: aDocuemnt
]

{ #category : #writing }
MOAngularDocumentWriter >> name: aName [

	writeBuilder name: aName
]
