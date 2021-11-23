Class {
	#name : #MOAnnotationInstance,
	#superclass : #MONewExpression,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOAnnotationInstance >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitAnnotation: self .
]
