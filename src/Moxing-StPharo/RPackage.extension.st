Extension { #name : #RPackage }

{ #category : #'*Moxing-StPharo' }
RPackage >> acceptVisitor: aMORBPharoImporter [ 
	^ aMORBPharoImporter visitRPackage: self 
]
