Class {
	#name : #MOAlceTable,
	#superclass : #MOClass,
	#instVars : [
		'#indexes => MOPropertySlot',
		'#relations => MOExpressionSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAlceTable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitTable: self
]

{ #category : #visiting }
MOAlceTable >> childrenForTree [

	^ super childrenForTree , relations
]

{ #category : #testing }
MOAlceTable >> hasIdColumns [

	^ indexes isNotNil and: [ 
		  indexes anySatisfy:  [ :a | a key = #PrimaryKey ] ]
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

{ #category : #testing }
MOAlceTable >> isTable [
	^ true 
]

{ #category : #visiting }
MOAlceTable >> producesParseableCode [
	 ^ false
]

{ #category : #visiting }
MOAlceTable >> relations [

	^ relations
]

{ #category : #visiting }
MOAlceTable >> relations: si [

	relations := si
]
