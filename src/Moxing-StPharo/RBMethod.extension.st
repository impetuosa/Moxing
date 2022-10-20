Extension { #name : #RBMethod }

{ #category : #'*Moxing-StPharo' }
RBMethod >> acceptVisitor: aMORBPharoImporter [

	^ aMORBPharoImporter visitRBMethod: self
]
