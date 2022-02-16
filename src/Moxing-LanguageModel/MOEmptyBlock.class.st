Class {
	#name : #MOEmptyBlock,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOEmptyBlock >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitEmptyBlock: self
]

{ #category : #adding }
MOEmptyBlock >> addStatement: aMOAssignment [

	self error: 'EmptyBlock cannot add statements'
]

{ #category : #adding }
MOEmptyBlock >> addVariable: aVariable [
	self error: 'EmptyBlock cannot add variables '
]

{ #category : #adding }
MOEmptyBlock >> statements [

	^ Array empty
]
