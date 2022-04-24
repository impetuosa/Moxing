Extension { #name : #RGMetaclassDefinition }

{ #category : #'*Moxing' }
RGMetaclassDefinition >> acceptVisitor: aVisitor [

	^ aVisitor visitMetaclass: self
]
