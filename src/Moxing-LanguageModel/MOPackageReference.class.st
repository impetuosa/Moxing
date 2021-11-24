Class {
	#name : #MOPackageReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #adding }
MOPackageReference >> addClass: aMOClass [

	candidate addType: aMOClass
]

{ #category : #adding }
MOPackageReference >> addPackage: aMOPackage [

	candidate addPackage: aMOPackage
]
