Class {
	#name : #MOAlceTable,
	#superclass : #MOClass,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceTable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitTable: self
]

{ #category : #visiting }
MOAlceTable >> isDatasource [ 
	 ^ true
]
