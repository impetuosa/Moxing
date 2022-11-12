Class {
	#name : #MOCase,
	#superclass : #MOStatement,
	#instVars : [
		'#expressions => MOExpressesSlot many',
		'#block => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOCase >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitCase: self
]

{ #category : #accessing }
MOCase >> block [
	^ block
]

{ #category : #accessing }
MOCase >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #accessing }
MOCase >> dependencies [

	^ (expressions flatCollect: #dependencies) , block dependencies
]

{ #category : #accessing }
MOCase >> expressions [
	^ expressions
]

{ #category : #accessing }
MOCase >> expressions: aCollection [ 
	expressions := aCollection
]
