Class {
	#name : #MOAnnotationInstance,
	#superclass : #MONewInvocation,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #visiting }
MOAnnotationInstance >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	^ aJinTypescriptCodeGenerator visitAnnotation: self .
]
