Class {
	#name : #MOAlceQuery,
	#superclass : #MOClass,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceQuery >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitQuery: self
]

{ #category : #testing }
MOAlceQuery >> hasIdColumns [
	^ false
]

{ #category : #visiting }
MOAlceQuery >> isDatasource [ 
	 ^ true
]

{ #category : #testing }
MOAlceQuery >> producesParseableCode [
	 ^ false
]
