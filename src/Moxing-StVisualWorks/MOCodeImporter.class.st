Class {
	#name : #MOCodeImporter,
	#superclass : #CodeImporter,
	#category : #'Moxing-StVisualWorks-CodeImport'
}

{ #category : #initialization }
MOCodeImporter >> initialize [ 
	super initialize .
	parserClass := MOChunkFileFormatParser 
]
