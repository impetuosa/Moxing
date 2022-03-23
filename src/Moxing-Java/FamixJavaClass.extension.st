Extension { #name : #FamixJavaClass }

{ #category : #'*Moxing-Java' }
FamixJavaClass >> allVisibleVariables [
	^ attributes , (superInheritances flatCollect: [ : s | s superclass allVisibleVariables ])
]
