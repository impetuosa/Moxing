Class {
	#name : #MOVariableArgumentsParameter,
	#superclass : #MOParameter,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOVariableArgumentsParameter >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitVarArgParameter: self
]

{ #category : #accessing }
MOVariableArgumentsParameter >> kindString [

	^ 'VARPAR'
]
