Extension { #name : #FamixJavaMethod }

{ #category : #'*Moxing-Java' }
FamixJavaMethod >> allVisibleVariables [
	^ self localVariables , parentType allVisibleVariables 
]
