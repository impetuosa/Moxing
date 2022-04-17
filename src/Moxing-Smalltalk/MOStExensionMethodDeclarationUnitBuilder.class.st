Class {
	#name : #MOStExensionMethodDeclarationUnitBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'extensionMethods',
		'classReference',
		'name',
		'extensionClassMethods'
	],
	#category : #'Moxing-Smalltalk-builer'
}

{ #category : #adding }
MOStExensionMethodDeclarationUnitBuilder >> addExtensionClassMethod: aMOStMethod [ 
	self extensionClassMethods add: aMOStMethod
]

{ #category : #adding }
MOStExensionMethodDeclarationUnitBuilder >> addExtensionMethod: aMOStMethod [
  self extensionMethods add: aMOStMethod
]

{ #category : #'as yet unclassified' }
MOStExensionMethodDeclarationUnitBuilder >> buildsType [

	 ^ MOStExensionMethodDeclarationUnit 
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> classReference [
	 ^ classReference ifNil: [ self error: 'Not class reference ' ]
]

{ #category : #'as yet unclassified' }
MOStExensionMethodDeclarationUnitBuilder >> classReference: aMOTypeReference [
  classReference := aMOTypeReference
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> extensionClassMethods [ 
	 ^ extensionClassMethods ifNil: [ extensionClassMethods := OrderedCollection new  ]
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> extensionMethods [ 
	 ^ extensionMethods ifNil: [ extensionMethods := OrderedCollection new  ]
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> loadBuilderWithEntity: anEntity [
  self extensionMethods: anEntity extensionMethods.
  self extensionClassMethods: anEntity extensionClassMethods.
  self name: anEntity name.
  self classReference: anEntity classReference
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> modelCopyHelper [
	^ MOModelCopyExtensionMethodBuilder new 
		  
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> name [
	^ name
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> name: aString [ 
	name := aString 
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnitBuilder >> privateBuild [
  ^(self instantiate: self buildsType)
     extensionMethods: self extensionMethods;
     extensionClassMethods: self extensionClassMethods;
     classReference: self classReference;
     name: self name;
     yourself
]
