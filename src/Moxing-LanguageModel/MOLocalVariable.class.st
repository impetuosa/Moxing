Class {
	#name : #MOLocalVariable,
	#superclass : #MOAbstractVariable,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOLocalVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitLocalVariable: self
]

{ #category : #visiting }
MOLocalVariable >> existsOnlyInParentContext [
	 ^ true 
]

{ #category : #visiting }
MOLocalVariable >> isExpression [

	^ true
]

{ #category : #visiting }
MOLocalVariable >> isStatement [

	^ true
]

{ #category : #visiting }
MOLocalVariable >> kindString [

	^ 'LOCAL VAR'
]
