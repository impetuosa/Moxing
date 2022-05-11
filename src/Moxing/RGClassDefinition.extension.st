Extension { #name : #RGClassDefinition }

{ #category : #'*Moxing' }
RGClassDefinition >> acceptVisitor: aVisitor [

	^ aVisitor visitClassDefinition: self
]
