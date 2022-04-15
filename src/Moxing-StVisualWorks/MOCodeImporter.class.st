Class {
	#name : #MOCodeImporter,
	#superclass : #CodeImporter,
	#category : #'Moxing-StVisualWorks-chunk importer'
}

{ #category : #initialization }
MOCodeImporter >> initialize [ 
	super initialize .
	parserClass := MOChunkFileFormatParser 
]
