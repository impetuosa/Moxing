Class {
	#name : #MOEmptyBlock,
	#superclass : #MOStatement,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOEmptyBlock >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitEmptyBlock: self
]

{ #category : #adding }
MOEmptyBlock >> isDeclaration [

	^ true
]

{ #category : #adding }
MOEmptyBlock >> isEmptyOrNil [

	^ true
]

{ #category : #adding }
MOEmptyBlock >> statements [

	^ Array empty
]
