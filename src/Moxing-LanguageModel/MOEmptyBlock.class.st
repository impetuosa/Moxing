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
MOEmptyBlock >> isEmptyOrNil [

	^ true
]

{ #category : #adding }
MOEmptyBlock >> statements [

	^ Array empty
]
