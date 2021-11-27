Class {
	#name : #MOImportPackage,
	#superclass : #MOImport,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOImportPackage >> acceptVisitor: aJinTypescriptCodeGenerator [

	aJinTypescriptCodeGenerator visitPackageDependency: self
]
