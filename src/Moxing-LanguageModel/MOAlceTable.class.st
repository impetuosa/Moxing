Class {
	#name : #MOAlceTable,
	#superclass : #MOClass,
	#instVars : [
		'#indexes => MOPropertySlot'
	],
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
MOAlceTable >> indexes [

	^ indexes
]

{ #category : #visiting }
MOAlceTable >> indexes: si [

	indexes := si
]

{ #category : #visiting }
MOAlceTable >> isDatasource [ 
	 ^ true
]

{ #category : #visiting }
MOAlceTable >> producesParseableCode [
	 ^ false
]
