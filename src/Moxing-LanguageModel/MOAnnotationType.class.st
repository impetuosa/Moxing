Class {
	#name : #MOAnnotationType,
	#superclass : #MOClassType,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOAnnotationType >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitAnnotationType: self
]
