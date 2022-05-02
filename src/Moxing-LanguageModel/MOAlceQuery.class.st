Class {
	#name : #MOAlceQuery,
	#superclass : #MOClass,
	#instVars : [
		'#sql => MOPropertySlot',
		'#expressions => MOExpressionSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceQuery >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitQuery: self
]

{ #category : #accessing }
MOAlceQuery >> expressions [
	^ expressions
]

{ #category : #accessing }
MOAlceQuery >> expressions: aCollection [ 
	expressions := aCollection
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
MOAlceQuery >> isQuery [

	^ true
]

{ #category : #testing }
MOAlceQuery >> producesParseableCode [
	 ^ false
]

{ #category : #testing }
MOAlceQuery >> sql [

	^ sql
]

{ #category : #testing }
MOAlceQuery >> sql: aString [ 	
	sql := aString 
]
