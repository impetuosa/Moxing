Class {
	#name : #MOAlceRedimVariable,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'#redimText => MOPropertySlot',
		'#reference => MOReferesSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAlceRedimVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitRedimVariable: self
]

{ #category : #accessing }
MOAlceRedimVariable >> redimText [
	^ redimText
]

{ #category : #accessing }
MOAlceRedimVariable >> redimText: aString [ 
	redimText := aString
]

{ #category : #accessing }
MOAlceRedimVariable >> reference: aMOVariableReference [ 
	reference := aMOVariableReference
]
