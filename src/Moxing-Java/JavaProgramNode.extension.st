Extension { #name : #JavaProgramNode }

{ #category : #'*Moxing-Java' }
JavaProgramNode >> enclosingFile [
	^ self enclosing: JavaProgramFileNode.
]
