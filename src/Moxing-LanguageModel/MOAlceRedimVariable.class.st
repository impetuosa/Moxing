Class {
	#name : #MOAlceRedimVariable,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'#redimText => MOPropertySlot',
		'#reference => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAlceRedimVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitRedimVariable: self
]

{ #category : #accessing }
MOAlceRedimVariable >> isStatement [

	^ true
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
