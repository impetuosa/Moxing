Extension { #name : #RPackageTag }

{ #category : #'*Moxing-StPharo' }
RPackageTag >> acceptVisitor: aMORBPharoImporter [

	^ aMORBPharoImporter visitRPackageTag: self
]
