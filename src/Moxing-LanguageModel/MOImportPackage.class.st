Class {
	#name : #MOImportPackage,
	#superclass : #MOImport,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOImportPackage >> acceptVisitor: aJinTypescriptCodeGenerator [

	aJinTypescriptCodeGenerator visitPackageDependency: self
]

{ #category : #visiting }
MOImportPackage >> resolvesType: aString [

	^ self types anySatisfy: [ :tr | tr name = aString ]
]

{ #category : #visiting }
MOImportPackage >> typeNamed: aString [

	^ self types detect: [ :a | a name = aString ]
]

{ #category : #visiting }
MOImportPackage >> types [
	^ typeReference candidate types
]
