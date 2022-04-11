Extension { #name : #SmaCCParseNode }

{ #category : #'*Moxing-Java' }
SmaCCParseNode >> enclosingFile [
	^ self enclosing: JavaProgramFileNode.
]
