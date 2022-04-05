Extension { #name : #RBClass }

{ #category : #'*Moxing-StPharo' }
RBClass >> acceptVisitor: aMORBPharoImporter [

	^ aMORBPharoImporter visitRBClass: self
]
