Extension { #name : #Association }

{ #category : #'*Moxing' }
Association >> acceptVisitor: aMoxingPackageTree [

	^ self value acceptVisitor: aMoxingPackageTree
]
