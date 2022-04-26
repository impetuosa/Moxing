Class {
	#name : #MOAlceTable,
	#superclass : #MOClass,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceTable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitTable: self
]

{ #category : #testing }
MOAlceTable >> hasIdColumns [
	^ false
]

{ #category : #visiting }
MOAlceTable >> isDatasource [ 
	 ^ true
]

{ #category : #visiting }
MOAlceTable >> producesParseableCode [
	 ^ false
]
