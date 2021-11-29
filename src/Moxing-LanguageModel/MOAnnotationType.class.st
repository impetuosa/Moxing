Class {
	#name : #MOAnnotationType,
	#superclass : #MOClass,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOAnnotationType >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitAnnotationType: self
]
