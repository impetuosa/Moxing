Extension { #name : #RGMethodDefinition }

{ #category : #'*Moxing' }
RGMethodDefinition >> acceptVisitor: aMOVisualWorksChunkImporter [

	^ aMOVisualWorksChunkImporter visitMethodDefinition: self
]
