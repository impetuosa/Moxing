Class {
	#name : #MOTypescriptTypeLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-ModelReading'
}

{ #category : #generated }
MOTypescriptTypeLoader >> visitNameExpression: aName [
	result name: aName name value 
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitTypeReference: aReference [ 
	result := MOTypescriptTypeReference new. 
	super visitTypeReference: aReference 
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitVoidType: aType [
	result := MOTypescriptTypeReference new. 
	result name: #void
]
