Class {
	#name : #MOStExensionMethodDeclarationUnit,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#classReference => MORefersSlot one',
		'#extensionMethods => MODeclaresSlot many',
		'#extensionClassMethods => MODeclaresSlot many',
		'#packageReference => MORefersSlot one'
	],
	#category : #'Moxing-Smalltalk-Model'
}

{ #category : #visiting }
MOStExensionMethodDeclarationUnit >> acceptVisitor: aVisitor [
 	 ^ aVisitor visitStExensionMethodDeclarationUnit: self 
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> category: aString [ 

]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> classReference [
	^ classReference
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> classReference: aMOTypeReference [ 
	classReference := aMOTypeReference
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> extensionClassMethods [
	^ extensionClassMethods
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> extensionClassMethods: aCollection [ 
	extensionClassMethods := aCollection
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> extensionMethods [
	^ extensionMethods
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> extensionMethods: aCollection [ 
	extensionMethods := aCollection
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> isDeclaration [ 
	^ true 
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> isMethodExtension [
	 ^ true 
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> name [
	 ^ classReference name 
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> packageReference [
  ^ packageReference
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> packageReference: aMOPackageReference [ 
	packageReference := aMOPackageReference
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> packageReferenceName [
  self assert: self parent isPackage.
  ^ self parent name
]

{ #category : #accessing }
MOStExensionMethodDeclarationUnit >> printOn: aStream [
  aStream
     nextPutAll: 'extension for class: ';
     nextPutAll:self  name
]
